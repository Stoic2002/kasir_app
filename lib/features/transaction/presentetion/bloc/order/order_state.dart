part of 'order_bloc.dart';

sealed class OrderState {}

final class OrderInitial extends OrderState {}

final class OrderLoading extends OrderState {}

final class OrderFailure extends OrderState {
  final String message;

  OrderFailure({required this.message});
}

final class OrderLoaded extends OrderState {
  final OrderModel orderModel;

  OrderLoaded({required this.orderModel});
}

final class OrderSuccess extends OrderState {}
