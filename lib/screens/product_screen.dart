import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/ProductsResponse.dart';

class ProductScreen extends StatefulWidget {
  final ProductsResponse productList;
  const ProductScreen({
    super.key,
    required this.productList,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late int quantity = 1;
  void cartAdd() async {
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection('cart')
        .doc(widget.productList.id)
        .set({
      'title': widget.productList.name,
      'price': widget.productList.price,
      'quantity': quantity,
      'pId': widget.productList.id,
    });
  }
  addQuantity() async {
    if (quantity == 1 && quantity > 1) {
      return quantity++;
    }
  }

  Future<int> removeQuantity() async {
    if (quantity == 1) {
      return quantity;
    } else {
      return quantity--;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> productImages = [
      widget.productList.image,
      //'https://www.ikea.com/in/en/images/products/nodeland-coffee-table-medium-brown__0974637_pe812499_s5.jpg',
      //'https://i.postimg.cc/rw8CS9BZ/char11.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 140,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        removeQuantity();
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_circle_outline,
                          color: Colors.white),
                    ),
                    Text(
                      '$quantity'.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () {
                        addQuantity();
                        setState(() {});
                      },
                      icon: const Icon(Icons.add_circle_outline,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              child: Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 11.0, horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "ADD TO CART",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                cartAdd();
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 280,
            child: CarouselSlider(
              options: CarouselOptions(autoPlay: true),
              items: productImages
                  .map((item) => Center(
                  child:
                  Image.network(item, fit: BoxFit.cover, width: 280)))
                  .toList(),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.productList.name,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.star_border,
                      color: Colors.pinkAccent,
                    ),
                    Text(
                      "4.5",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  widget.productList.price.toString(),
                  style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.normal,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            child: Divider(
              thickness: .8,
              color: Colors.black38,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Description :",
                  style: TextStyle(color: Colors.pinkAccent, fontSize: 20),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(widget.productList.description,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    maxLines: 5),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
