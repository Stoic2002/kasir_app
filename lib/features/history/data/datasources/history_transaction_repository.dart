import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kasir_app/features/history/data/models/transaction_model.dart';
import 'package:kasir_app/features/transaction/data/models/products_model.dart';

class HistoryRepo {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('orders');

  Stream<List<TransactionModel>> getTransaction() {
    return ordersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        List<ProductsModel> products =
            (data['products'] as List<dynamic>).map((productData) {
          return ProductsModel(
            productId: productData['productId'],
            productName: productData['name'],
            quantity: productData['quantity'],
            productPrice: productData['price'],
          );
        }).toList();

        return TransactionModel(
            id: doc.id,
            userId: data['userId'],
            transactionId: data['transactionId'],
            subTotal: data['subTotal'],
            createdAt: data['created_at'],
            products: products);
      }).toList();
    });
  }

  Future<void> deleteTx(String uid) {
    return ordersCollection.doc(uid).delete();
  }
}
