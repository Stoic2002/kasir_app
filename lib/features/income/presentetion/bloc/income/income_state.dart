part of 'income_bloc.dart';

class IncomeState extends Equatable {
  const IncomeState(
      {this.todayTransactions,
      this.todayTotalTransactions,
      this.todayTotalPurchases,
      this.monthlyTransactions,
      this.monthlyTotalTransactions,
      this.monthlyTotalPurchases,
      this.isLoading = false,
      this.error,
      this.dailyIncomeForMonth});
  final List<OrderModel>? todayTransactions;
  final int? todayTotalTransactions;
  final int? todayTotalPurchases;
  final List<OrderModel>? monthlyTransactions;
  final int? monthlyTotalTransactions;
  final int? monthlyTotalPurchases;
  final bool isLoading;
  final String? error;
  final List<DailyIncome>? dailyIncomeForMonth;

  @override
  List<Object?> get props => [
        todayTransactions,
        todayTotalTransactions,
        todayTotalPurchases,
        monthlyTransactions,
        monthlyTotalTransactions,
        monthlyTotalPurchases,
        isLoading,
        error,
        dailyIncomeForMonth
      ];

  IncomeState copyWith(
      {List<OrderModel>? todayTransactions,
      int? todayTotalTransactions,
      int? todayTotalPurchases,
      List<OrderModel>? monthlyTransactions,
      int? monthlyTotalTransactions,
      int? monthlyTotalPurchases,
      bool? isLoading,
      String? error,
      List<DailyIncome>? dailyIncomeForMonth}) {
    return IncomeState(
        todayTransactions: todayTransactions ?? this.todayTransactions,
        todayTotalTransactions:
            todayTotalTransactions ?? this.todayTotalTransactions,
        todayTotalPurchases: todayTotalPurchases ?? this.todayTotalPurchases,
        monthlyTransactions: monthlyTransactions ?? this.monthlyTransactions,
        monthlyTotalTransactions:
            monthlyTotalTransactions ?? this.monthlyTotalTransactions,
        monthlyTotalPurchases:
            monthlyTotalPurchases ?? this.monthlyTotalPurchases,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        dailyIncomeForMonth: dailyIncomeForMonth ?? this.dailyIncomeForMonth);
  }
}

final class IncomeInitial extends IncomeState {}

class IncomeLoading extends IncomeState {}

class IncomeTodayLoaded extends IncomeState {
  final List<OrderModel> transactions;
  final int totalTransactions;
  final int totalPurchases;

  const IncomeTodayLoaded(
      this.transactions, this.totalPurchases, this.totalTransactions);

  @override
  List<Object> get props => [transactions];
}

class IncomeMonthlyLoaded extends IncomeState {
  final List<OrderModel> transactions;
  final int totalTransactions;
  final int totalPurchases;

  const IncomeMonthlyLoaded(
      this.transactions, this.totalPurchases, this.totalTransactions);

  @override
  List<Object> get props => [transactions];
}

class IncomeError extends IncomeState {
  final String message;

  const IncomeError(this.message);

  @override
  List<Object> get props => [message];
}
