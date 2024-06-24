part of 'getcategory_bloc.dart';

sealed class GetcategoryState extends Equatable {
  const GetcategoryState();

  @override
  List<Object> get props => [];
}

final class GetcategoryInitial extends GetcategoryState {}

final class GetcategoryLoading extends GetcategoryState {}

final class GetcategoryFailure extends GetcategoryState {
  final String message;

  GetcategoryFailure({required this.message});
}

final class GetcategoryLoaded extends GetcategoryState {
  final List<ProductNewModel> categoryModel;

  GetcategoryLoaded({required this.categoryModel});
}
