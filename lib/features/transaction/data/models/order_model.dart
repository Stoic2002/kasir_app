import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kasir_app/features/transaction/data/models/products_model.dart';

class OrderModel {
  final String? id;
  final int? transactionId;
  final String userId;
  final int? subtotal;
  final String createdAt;
  final DateTime? orderAt;

  final List<ProductsModel> products;

  OrderModel(
      {required this.transactionId,
      required this.id,
      required this.subtotal,
      required this.products,
      required this.userId,
      required this.createdAt,
      required this.orderAt});

  static OrderModel fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return OrderModel(
      userId: snapshot['userId'],
      transactionId: snapshot['transactionId'],
      id: snapshot['id'],
      subtotal: snapshot['subTotal'],
      orderAt: snapshot['order_at'],
      createdAt: snapshot['created_at'],
      products: snapshot["products"] == null
          ? []
          : List<ProductsModel>.from(
              snapshot["products"]!.map((x) => ProductsModel.fromSnapshot(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "transactionId": transactionId,
        "id": id,
        "order_at": orderAt,
        'created_at': createdAt,
        "subTotal": subtotal,
        "products": products == ""
            ? []
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
