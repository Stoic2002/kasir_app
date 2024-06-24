part of 'getproduct_bloc.dart';

sealed class GetproductEvent extends Equatable {
  const GetproductEvent();

  @override
  List<Object> get props => [];
}

class GetproductLoad extends GetproductEvent {}
