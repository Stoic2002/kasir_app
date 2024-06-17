import 'package:kasir_app/features/transaction/data/models/products_model.dart';

class TransactionModel {
  final String id;
  final int transactionId;
  final String userId;
  final int subTotal;
  final String createdAt;
  final List<ProductsModel> products;

  TransactionModel(
      {required this.transactionId,
      required this.userId,
      required this.subTotal,
      required this.id,
      required this.createdAt,
      required this.products});
}
