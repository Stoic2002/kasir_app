part of 'transaction_bloc.dart';

sealed class TransactionState extends Equatable {
  const TransactionState();

  @override
  List<Object> get props => [];
}

final class TransactionInitial extends TransactionState {}

final class TransactionLoading extends TransactionState {}

final class TransactionLoaded extends TransactionState {
  final List<TransactionModel> transaction;

  TransactionLoaded({required this.transaction});
}

final class TransactionFailure extends TransactionState {
  final String message;

  TransactionFailure({required this.message});
}
