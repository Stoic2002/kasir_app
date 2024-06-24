import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:kasir_app/features/income/data/datasources/income_repo.dart';
import 'package:kasir_app/features/income/data/models/daily_income_model.dart';
import 'package:kasir_app/features/transaction/data/models/order_model.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  final IncomeRepo _incomeRepo;
  IncomeBloc(this._incomeRepo) : super(IncomeInitial()) {
    on<LoadTodaysTransactions>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(isLoading: true));
      try {
        final transaction = await _incomeRepo.getTodaysTransactions().first;
        final totalTransactions = transaction.length;
        final totalPurchases =
            transaction.fold(0, (sum, item) => sum + item.subtotal!);

        emit(state.copyWith(
          todayTransactions: transaction,
          todayTotalTransactions: totalTransactions,
          todayTotalPurchases: totalPurchases,
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });

    on<LoadMonthlyTransactions>((event, emit) async {
      // TODO: implement event handler
      emit(state.copyWith(isLoading: true));
      try {
        final transaction = await _incomeRepo.getMonthlyTransactions().first;
        final totalTransactions = transaction.length;
        final totalPurchases =
            transaction.fold(0, (sum, item) => sum + item.subtotal!);

        emit(state.copyWith(
          monthlyTransactions: transaction,
          monthlyTotalTransactions: totalTransactions,
          monthlyTotalPurchases: totalPurchases,
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });

    on<LoadDailyIncomeForMonth>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final dailyIncome = await _incomeRepo.getDailyIncomeForMonth().first;
        emit(state.copyWith(
          dailyIncomeForMonth: dailyIncome,
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(error: e.toString(), isLoading: false));
      }
    });
  }
}
