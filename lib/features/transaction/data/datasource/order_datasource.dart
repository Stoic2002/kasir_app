import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kasir_app/features/transaction/data/models/order_model.dart';

class OrderDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future order(OrderModel orderRequestModel, String docId) async {
    try {
      final orderData = orderRequestModel.toJson();
      final orderId =
          await _firestore.collection('orders').doc(docId).set(orderData);
      return orderId;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
