import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CartResponse cartResponseFromJson(String str) => CartResponse.fromJson(json.decode(str));

String cartResponseToJson(CartResponse data) => json.encode(data.toJson());

class CartResponse {
  CartResponse({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,

  });

  String id;
  String name;
  double price;
  String image;
  double quantity;

  factory CartResponse.fromJson(Map<String, dynamic> json) => CartResponse(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
    quantity: json[" quantity"],
  );

  factory CartResponse.fromSnapshot(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>?;
    return CartResponse(
      id: snap.id,
      name: data?['title'] ?? '',
      price: double.parse(data?['price']),
      image: data?['image'] ?? '',
      quantity: double.parse(data?['quantity']),
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "image": image,
    "quantity": quantity,

  };
}
