part of 'transaction_bloc.dart';

sealed class TransactionEvent extends Equatable {
  const TransactionEvent();

  @override
  List<Object> get props => [];
}

class TransactionLoad extends TransactionEvent {}

class TransactionRefresh extends TransactionEvent {
  final List<TransactionModel> transactions;

  TransactionRefresh({required this.transactions});

  @override
  List<Object> get props => [transactions];
}
