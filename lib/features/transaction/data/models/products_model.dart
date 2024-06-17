import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  final int productId;
  final String productName;
  final int productPrice;
  final int quantity;

  ProductsModel(
      {required this.productId,
      required this.quantity,
      required this.productName,
      required this.productPrice});

  static ProductsModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ProductsModel(
      productId: snapshot['productId'],
      productName: snapshot['name'],
      productPrice: snapshot['price'],
      quantity: snapshot['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": productName,
        "price": productPrice,
        "quantity": quantity,
      };
}
