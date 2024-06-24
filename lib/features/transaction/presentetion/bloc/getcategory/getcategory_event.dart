part of 'getcategory_bloc.dart';

sealed class GetcategoryEvent extends Equatable {
  const GetcategoryEvent();

  @override
  List<Object> get props => [];
}

class GetcategoryLoad extends GetcategoryEvent {}
