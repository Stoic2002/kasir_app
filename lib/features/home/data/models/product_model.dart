import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final int categoryId;
  final String name;
  final String categoryName;
  final ImageProvider<Object> image;
  final int price;
  final String description;
  final int stock;
  final int isAvailable;
  final DateTime createdAt;
  final DateTime updateAt;

  ProductModel(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.categoryName,
      required this.image,
      required this.price,
      required this.description,
      required this.stock,
      required this.isAvailable,
      required this.createdAt,
      required this.updateAt});
}
