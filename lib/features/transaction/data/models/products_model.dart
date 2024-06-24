import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsModel {
  final String productId;
  final String productName;
  final String imageUrl;
  final int productPrice;
  final int quantity;

  ProductsModel(
      {required this.productId,
      required this.quantity,
      required this.imageUrl,
      required this.productName,
      required this.productPrice});

  static ProductsModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ProductsModel(
      productId: snapshot['productId'],
      productName: snapshot['name'],
      imageUrl: snapshot['imageUrl'],
      productPrice: snapshot['price'],
      quantity: snapshot['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": productName,
        "imageUrl": imageUrl,
        "price": productPrice,
        "quantity": quantity,
      };
}
