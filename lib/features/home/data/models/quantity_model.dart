import 'package:kasir_app/features/home/data/models/product_model.dart';

class QuantityModel {
  final ProductModel product;
  final int quantity;

  QuantityModel({required this.product, required this.quantity});

  QuantityModel copyWith({
    ProductModel? product,
    int? quantity,
  }) {
    return QuantityModel(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuantityModel &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;
}
