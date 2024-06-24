import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:kasir_app/features/home/data/models/product_new_model.dart';
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

//get list product by category
  Stream<List<ProductNewModel>> getCategory() {
    return _firestore.collection('products').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          description: data['description'],
          imageUrl: data['imageUrl'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  //get list product by category
  Stream<List<ProductNewModel>> getProductFood() {
    return _firestore
        .collection('products')
        .where('categoryName', isEqualTo: 'makanan')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          imageUrl: data['imageUrl'],
          description: data['description'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  //get list product by category
  Stream<List<ProductNewModel>> getProductDrink() {
    return _firestore
        .collection('products')
        .where('categoryName', isEqualTo: 'minuman')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          imageUrl: data['imageUrl'],
          description: data['description'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  //get list product by category
  Stream<List<ProductNewModel>> getProductSnacks() {
    return _firestore
        .collection('products')
        .where('categoryName', isEqualTo: 'cemilan')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          imageUrl: data['imageUrl'],
          description: data['description'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  //get list product by category
  Stream<List<ProductNewModel>> getProductLiquor() {
    return _firestore
        .collection('products')
        .where('categoryName', isEqualTo: 'liquor')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductNewModel(
          id: doc.id,
          categoryName: data['categoryName'],
          name: data['name'],
          imageUrl: data['imageUrl'],
          description: data['description'],
          price: data['price'],
          created_at: (data['created_at'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }
}
