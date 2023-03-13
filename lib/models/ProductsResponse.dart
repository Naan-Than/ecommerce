import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ProductsResponse productsResponseFromJson(String str) => ProductsResponse.fromJson(json.decode(str));

String productsResponseToJson(ProductsResponse data) => json.encode(data.toJson());

class ProductsResponse {
  ProductsResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.description,

  });

  String id;
  String name;
  double price;
  String image;
  String description;

  factory ProductsResponse.fromJson(Map<String, dynamic> json) => ProductsResponse(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
    description: json["description"],
  );

  factory ProductsResponse.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>?;
    return ProductsResponse(
      id: snap.id,
      name: data?['title'] ?? '',
      price: double.parse(data?['price']),
      image: data?['image'] ?? '',
      description:data?['description']??'',
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "image": image,
    "description": description,

  };
}
