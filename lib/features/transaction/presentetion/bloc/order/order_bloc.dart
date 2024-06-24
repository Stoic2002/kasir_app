import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:intl/intl.dart';

import 'package:kasir_app/features/home/data/models/quantity_model.dart';
import 'package:kasir_app/features/transaction/data/datasource/order_datasource.dart';
import 'package:kasir_app/features/transaction/data/models/order_model.dart';
import 'package:kasir_app/features/transaction/data/models/products_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final OrderDatasource _datasource;
  OrderBloc(this._datasource) : super(OrderInitial()) {
    on<OnOrder>((event, emit) async {
      // TODO: implement event
      emit(OrderLoading());
      int subTotal = 0;
      for (var product in event.products) {
        subTotal += product.product.price * product.quantity;
      }

      final formattedDate = DateFormat(
        "d MMMM yyyy",
        "id_ID",
      ).format(DateTime.now());

      final col = _firestore.collection('orders');
      final doc = col.doc();

      try {
        final orderRequestData = OrderModel(
            id: doc.id,
            userId: event.userId,
            transactionId: event.transactionId,
            subtotal: subTotal,
            createdAt: formattedDate,
            orderAt: DateTime.now(),
            products: event.products
                .map(
                  (e) => ProductsModel(
                    productId: e.product.id,
                    productName: e.product.name,
                    imageUrl: e.product.imageUrl,
                    productPrice: e.product.price,
                    quantity: e.quantity,
                  ),
                )
                .toList());
        final data = await _datasource.order(orderRequestData, doc.id);
        if (data is String) {
          emit(OrderFailure(message: data));
        } else {
          emit(OrderSuccess());
        }
      } catch (e) {
        emit(OrderFailure(message: e.toString()));
      }
    });
  }
}
