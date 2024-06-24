part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends ProductEvent {
  final XFile image;
  final String categoryName;
  final String imageUrl;
  final String name;
  final String description;
  final int price;

  AddProduct({
    required this.image,
    required this.categoryName,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  List<Object> get props =>
      [image, categoryName, name, imageUrl, description, price];
}

class GetListProducts extends ProductEvent {}
