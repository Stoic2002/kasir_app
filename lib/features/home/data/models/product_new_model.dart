import 'dart:convert';

class ProductNewModel {
  final String id;
  final String categoryName;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final DateTime created_at;

  ProductNewModel({
    required this.id,
    required this.categoryName,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.created_at,
  });

  ProductNewModel copyWith({
    String? id,
    String? categoryName,
    String? name,
    String? description,
    String? imageUrl,
    int? price,
    DateTime? created_at,
  }) {
    return ProductNewModel(
      id: id ?? this.id,
      categoryName: categoryName ?? this.categoryName,
      name: name ?? this.name,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      created_at: created_at ?? this.created_at,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});

    result.addAll({'categoryName': categoryName});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'price': price});
    result.addAll({'created_at': created_at});

    return result;
  }

  factory ProductNewModel.fromMap(Map<String, dynamic> map) {
    return ProductNewModel(
      id: map['id'],
      categoryName: map['categoryName'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      price: map['price']?.toInt(),
      created_at: DateTime(map['created_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductNewModel.fromJson(String source) =>
      ProductNewModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductNewModel(id: $id, categoryName: $categoryName, name: $name, description: $description, imageUrl: $imageUrl, price: $price, created_at: $created_at)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductNewModel &&
        other.id == id &&
        other.categoryName == categoryName &&
        other.name == name &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.price == price &&
        other.created_at == created_at;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        categoryName.hashCode ^
        name.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        price.hashCode ^
        created_at.hashCode;
  }
}
