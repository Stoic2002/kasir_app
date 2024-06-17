part of 'order_bloc.dart';

sealed class OrderEvent {}

class OnOrder extends OrderEvent {
  final int transactionId;
  final String userId;
  final List<QuantityModel> products;

  OnOrder(
      {required this.transactionId,
      required this.products,
      required this.userId});
}
