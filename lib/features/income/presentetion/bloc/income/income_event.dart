part of 'income_bloc.dart';

sealed class IncomeEvent extends Equatable {
  const IncomeEvent();

  @override
  List<Object> get props => [];
}

class LoadTodaysTransactions extends IncomeEvent {}

class LoadMonthlyTransactions extends IncomeEvent {}

class LoadDailyIncomeForMonth extends IncomeEvent {}
