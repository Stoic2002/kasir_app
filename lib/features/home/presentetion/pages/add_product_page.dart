import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kasir_app/core/constants/app_colors.dart';
import 'package:kasir_app/features/auth/presentetion/widget/button.dart';
import 'package:kasir_app/features/home/presentetion/bloc/product/product_bloc.dart';
import 'package:kasir_app/features/home/presentetion/widget/choose_category.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  String imgUrl = '';
  XFile? image;
  String? _selectedCategory;
  int? _price;

  @override
  void initState() {
    super.initState();
    nameController.text = "";
    descController.text = "";
    imageController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is ProductFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is ProductLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product successfully added!')),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: content(),
          );
        },
      ),
    );
  }

  Widget content() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text('Nama Product'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Nama product tidak boleh kosong";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            CategoryDropdown(
              onCategorySelected: (p0) {
                setState(() {
                  _selectedCategory = p0;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descController,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text('Deskripsi'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Deskripsi tidak boleh kosong";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                setState(() {
                  _price = int.tryParse(value);
                });
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                label: Text('Harga'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Harga tidak boleh kosong";
                }
                return null;
              },
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: TextFormField(
                      controller: imageController,
                      enabled: false,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Foto belum diupload',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      final ImagePicker _picker = ImagePicker();
                      XFile? img =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (img != null) {
                        setState(() {
                          image = img;
                        });
                        imageController.text = img.name;
                      }
                    },
                    icon: Icon(Icons.photo_camera),
                    label: Text(
                      'Upload',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            QButton(
              label: 'add product',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please upload an image')),
                    );
                    return;
                  }
                  if (_selectedCategory == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select a category')),
                    );
                    return;
                  }
                  context.read<ProductBloc>().add(AddProduct(
                        image: image!,
                        imageUrl: imgUrl,
                        categoryName: _selectedCategory!,
                        name: nameController.text,
                        description: descController.text,
                        price: _price!,
                      ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
