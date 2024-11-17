import 'dart:convert';
import 'package:get/get.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final String image;
  RxInt quantity;

  ProductModel({
    required this.id, // Add 'id' to required parameters
    required this.name,
    required this.price,
    required this.description,
    required this.image,
    int quantity = 1,
  }) : quantity = quantity.obs;

  ProductModel copyWith({
    int? id,
    String? name,
    double? price,
    String? description,
    String? image,
    int? quantity,
  }) {
    return ProductModel(
      id: id ?? this.id, // Update 'id' in copyWith
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Add 'id' to map
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'quantity': quantity.value,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0, // Add 'id' from map
      name: map['name'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      quantity: map['quantity']?.toInt() ?? 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, price: $price, description: $description, image: $image, quantity: ${quantity.value})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id && // Compare 'id'
        other.name == name &&
        other.price == price &&
        other.description == description &&
        other.image == image &&
        other.quantity.value == quantity.value;
  }

  @override
  int get hashCode {
    return id.hashCode ^ // Include 'id' in hashCode
    name.hashCode ^
    price.hashCode ^
    description.hashCode ^
    image.hashCode ^
    quantity.value.hashCode;
  }
}
