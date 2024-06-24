import 'package:bloc/bloc.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';
import 'package:kasir_app/features/home/data/models/quantity_model.dart';
import 'package:meta/meta.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(CheckoutLoaded(products: [])) {
    on<AddProduct>((event, emit) {
      // TODO: implement event handler
      final currentState = state as CheckoutLoaded;
      if (currentState.products
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.products
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.products[index];
        final newItem = item.copyWith(quantity: item.quantity + 1);
        final newItems =
            currentState.products.map((e) => e == item ? newItem : e).toList();
        emit(CheckoutLoaded(
          products: newItems,
        ));
      } else {
        final newitem = QuantityModel(product: event.product, quantity: 1);
        final newItems = [...currentState.products, newitem];
        emit(CheckoutLoaded(
          products: newItems,
        ));
      }
    });

    on<RemoveProduct>((event, emit) {
      final currentState = state as CheckoutLoaded;
      if (currentState.products
          .any((element) => element.product.id == event.product.id)) {
        final index = currentState.products
            .indexWhere((element) => element.product.id == event.product.id);
        final item = currentState.products[index];
        if (item.quantity == 1) {
          final newItems = currentState.products
              .where((element) => element.product.id != event.product.id)
              .toList();
          emit(CheckoutLoaded(
            products: newItems,
          ));
        } else {
          final newItem = item.copyWith(quantity: item.quantity - 1);
          final newItems = currentState.products
              .map((e) => e == item ? newItem : e)
              .toList();
          emit(CheckoutLoaded(
            products: newItems,
          ));
        }
      }
    });

    on<ResetProduct>(((event, emit) {
      emit(CheckoutLoaded(products: []));
    }));
  }
}
