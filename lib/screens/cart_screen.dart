import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../models/cartResponse.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartResponse> cartProductList = [];
  late double totalAmount;
  fetchData() async {
    String uid = FirebaseAuth.instance.currentUser!.uid.toString();
    var documentSnapshot =
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection('cart').get();
    var data =
    documentSnapshot.docs.map((e) => CartResponse.fromSnapshot(e));
    setState(() {
      cartProductList.addAll(data);
      for (var element in cartProductList) {
        totalAmount = totalAmount + (element.price * element.quantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black54, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: cartProductList.length,
                  itemBuilder: (context, index) {
                    if (cartProductList.isEmpty){
                      return const Text("no item found");
                    }else{
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 130,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Image.network(cartProductList[index].image
                                  //'https://i.postimg.cc/rw8CS9BZ/char11.jpg',
                                ),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Text(cartProductList[index].name,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 22),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      (cartProductList[index].price * cartProductList[index].quantity).toString(),
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 0,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cartProductList[index].quantity = cartProductList[index].quantity - 1;
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Colors.black54),
                                      ),
                                      Text(
                                        cartProductList[index].quantity.toString(),
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            cartProductList[index].quantity = cartProductList[index].quantity + 1;
                                          });
                                        },
                                        icon: const Icon(Icons.add_circle_outline,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            ),
            const SizedBox(
              height: 14.0,
            ),
            const Text(
              "Total Amount",
              style: TextStyle(color: Colors.black45, fontSize: 20),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              "\$$totalAmount",
              style: const TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                  fontSize: 24),
            ),

          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "CHECKOUT ",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
