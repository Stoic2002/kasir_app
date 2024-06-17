import 'package:kasir_app/features/home/data/models/product_model.dart';

class CategoryModel {
  final int categoryId;
  final String categoryName;
  final List<ProductModel> productModel;

  CategoryModel(
      {required this.categoryId,
      required this.categoryName,
      required this.productModel});
}
