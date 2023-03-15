import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/ProductsResponse.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/utility.dart';
import 'package:flutter/material.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({Key? key}) : super(key: key);

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {

  List<ProductsResponse> productList = [];
  fetchData() async {
    var documentSnapshot =
    await FirebaseFirestore.instance.collection('Products').get();
    var data =
    documentSnapshot.docs.map((e) => ProductsResponse.fromSnapshot(e));
    setState(() {
      productList.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0.5,
        title: const Text(
          "Products",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: Column(
        children: [
          GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Utility.customCard(productList[index]),
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ProductScreen(productList: productList[index])));
                  },
                );

              },

          ),
          GridView.count(
            crossAxisSpacing: 30.0,
              crossAxisCount: 2,
            children: [

            ],
          ),
        ],
      ),
    );
  }
}
