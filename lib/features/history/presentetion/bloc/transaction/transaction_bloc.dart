import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasir_app/features/history/data/datasources/history_transaction_repository.dart';
import 'package:kasir_app/features/history/data/models/transaction_model.dart';

part 'transaction_event.dart';
part 'transaction_state.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final HistoryRepo historyRepo;
  TransactionBloc(this.historyRepo) : super(TransactionInitial()) {
    on<TransactionLoad>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(TransactionLoading());
        final transaction = await historyRepo.getTransaction().first;
        emit(TransactionLoaded(transaction: transaction));
      } catch (e) {
        emit(TransactionFailure(message: e.toString()));
      }
    });
  }
}
