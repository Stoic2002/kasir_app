part of 'checkout_bloc.dart';

@immutable
sealed class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutFailure extends CheckoutState {
  final String message;

  CheckoutFailure({required this.message});
}

final class CheckoutLoaded extends CheckoutState {
  final List<QuantityModel> products;

  CheckoutLoaded({required this.products});
}
