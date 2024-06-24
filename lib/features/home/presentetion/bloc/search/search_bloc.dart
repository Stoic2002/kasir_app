import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kasir_app/features/home/data/datasources/firebase_repo.dart';
import 'package:kasir_app/features/home/data/models/product_new_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  FirebaseRepo _firebaseRepo;
  SearchBloc(this._firebaseRepo) : super(SearchInitial()) {
    on<SearchQueryChanged>((event, emit) async {
      // TODO: implement event handler
      emit(SearchLoading());
      try {
        final products = await _firebaseRepo.searchProducts(event.query).first;
        emit(SearchLoaded(products));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
