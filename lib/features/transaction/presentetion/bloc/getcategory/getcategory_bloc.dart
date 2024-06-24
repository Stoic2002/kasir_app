import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';
import 'package:kasir_app/features/transaction/data/datasource/order_datasource.dart';

part 'getcategory_event.dart';
part 'getcategory_state.dart';

class GetcategoryBloc extends Bloc<GetcategoryEvent, GetcategoryState> {
  OrderDatasource _orderDatasource;
  GetcategoryBloc(this._orderDatasource) : super(GetcategoryInitial()) {
    on<GetcategoryLoad>((event, emit) async {
      // TODO: implement event handler
      try {
        emit(GetcategoryLoading());
        final listCategory = await _orderDatasource.getCategory().first;

        emit(GetcategoryLoaded(categoryModel: listCategory));
      } catch (e) {
        emit(GetcategoryFailure(message: e.toString()));
      }
    });
  }
}
