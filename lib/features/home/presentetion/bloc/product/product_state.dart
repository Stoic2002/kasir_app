part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductFailure extends ProductState {
  final String message;

  ProductFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class ProductLoaded extends ProductState {}

class CategoryProductsLoaded extends ProductState {
  final List<ProductNewModel> foodProducts;
  final List<ProductNewModel> drinkProducts;

  CategoryProductsLoaded(
      {required this.foodProducts, required this.drinkProducts});
}
