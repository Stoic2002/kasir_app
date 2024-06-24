import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';

import 'package:kasir_app/features/transaction/data/datasource/order_datasource.dart';

part 'getproduct_event.dart';
part 'getproduct_state.dart';

class GetproductBloc extends Bloc<GetproductEvent, GetproductState> {
  final OrderDatasource _orderDatasource;
  GetproductBloc(this._orderDatasource) : super(GetproductInitial()) {
    on<GetproductLoad>((event, emit) async {
      try {
        emit(GetproductLoading());
        final listFoodProduct = await _orderDatasource.getProductFood().first;
        final listDrinkProduct = await _orderDatasource.getProductDrink().first;
        final listSnacksProduct =
            await _orderDatasource.getProductSnacks().first;
        final listLiquorProduct =
            await _orderDatasource.getProductLiquor().first;

        emit(GetproductLoaded(
            foodProducts: listFoodProduct,
            drinkProducts: listDrinkProduct,
            snackProducts: listSnacksProduct,
            liquorProducts: listLiquorProduct));
      } catch (e) {
        emit(GetproductFailure(message: e.toString()));
      }
    });
  }
}
