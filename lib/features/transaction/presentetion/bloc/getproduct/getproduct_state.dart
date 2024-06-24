part of 'getproduct_bloc.dart';

sealed class GetproductState extends Equatable {
  const GetproductState();

  @override
  List<Object> get props => [];
}

final class GetproductInitial extends GetproductState {}

final class GetproductLoading extends GetproductState {}

final class GetproductFailure extends GetproductState {
  final String message;

  GetproductFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetproductLoaded extends GetproductState {
  final List<ProductNewModel> foodProducts;
  final List<ProductNewModel> drinkProducts;
  final List<ProductNewModel> snackProducts;
  final List<ProductNewModel> liquorProducts;

  GetproductLoaded(
      {required this.foodProducts,
      required this.drinkProducts,
      required this.liquorProducts,
      required this.snackProducts});

  @override
  List<Object> get props =>
      [foodProducts, drinkProducts, snackProducts, liquorProducts];
}
