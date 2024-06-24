import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryDropdown({super.key, required this.onCategorySelected});
  @override
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  String? _selectedCategory;
  final List<String> _categories = [
    'makanan',
    'minuman',
    'cemilan',
    'liquor',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          hint: Text('Pilih Kategori'),
          value: _selectedCategory,
          items: _categories.map((String category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedCategory = newValue;
              if (widget.onCategorySelected != '') {
                widget.onCategorySelected(newValue!);
              }
            });
          },
          isExpanded: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          dropdownColor: Colors.grey[200],
          iconEnabledColor: Colors.black,
        ),
      ),
    );
  }
}
