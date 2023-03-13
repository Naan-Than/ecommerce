
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/drawer.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/utility.dart';
import 'package:flutter/material.dart';

import '../models/ProductsResponse.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<ProductsResponse> productList = [];

  List<ProductsResponse> newProductList = [];

  Color textColor=Colors.pinkAccent;
  List<String>chipList=[
    'All',
    'Electronics',
    'Appliances',
    'Shirt',
    'Men',
    'Cosmetics',
  ];

  List<ProductsResponse> currentProductList = [];
  fetchData() async {
    var documentSnapshot = await FirebaseFirestore.instance.collection('Products').get();
    var data = documentSnapshot.docs.map((e) => ProductsResponse.fromSnapshot(e));print(data.length);
    setState(() {
      productList.addAll(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerScreen(),
      ),
      appBar: AppBar(elevation: 0.2,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Icon(Icons.notifications_none,color: Colors.black54,size: 28,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0,left: 28.0),
                child: CircleAvatar(radius: 4,backgroundColor: textColor,),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0,bottom: 4.0),
            child: IconButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>CartScreen()));
            }, icon:Icon(Icons.shopping_cart_outlined,color: Colors.black54,size: 26,),
    )          ),
        ],
      ),backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 43,
                    width: MediaQuery.of(context).size.width/1.35,
                    decoration: BoxDecoration(
                      color:Colors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.3),width: 1),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        focusColor: Colors.grey,
                        fillColor: Colors.black54,
                        border: InputBorder.none,
                        label: Text("Search",style: TextStyle(fontSize: 18),),
                        prefixIcon: Icon(Icons.search,size: 26,),
                      ),
                    ),
                  ),
                  Container(
                    height: 43,
                    width: MediaQuery.of(context).size.width/7,
                    decoration: BoxDecoration(
                      color:Colors.grey.withOpacity(0.1),
                      border: Border.all(color: Colors.grey.withOpacity(0.3),width: 1),
                    ),
                    child: const Icon(Icons.filter_alt_outlined,color: Colors.black45,),
                  ),
                ],
              ),
              SizedBox(height: 16.0,),
              Row(
                children: [
                  Text("TRENDING PRODUCTS  ",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),),
                  Expanded(child: Divider(thickness: 1,)),
                  Text("  See all",style: TextStyle(color:textColor,fontSize: 16,),),
                ],
              ),
              SizedBox(height: 12.0,),
               FutureBuilder(
                  future: fetchData(),
                  builder:
              (context,snapshot){
                return SizedBox(
                  height: 220,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: productList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Utility.customCard(productList[index]);
                    },
                  ),
                );
              }),

              const SizedBox(height: 12.0,),
              Row(
                children: [
                  Text("POPULAR CATEGORIES  ",style: TextStyle(color: Colors.black87,fontSize: 16,fontWeight: FontWeight.bold),),
                  Expanded(child: Divider(thickness: 1,)),
                  Text("  See all",style: TextStyle(color:textColor,fontSize: 16,),),
                ],
              ),
              SizedBox(height: 4.0,),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount:chipList.length,
                    itemBuilder:(context,index){
                      return Chip(backgroundColor: Colors.grey.shade200,
                          label: Text(chipList[index]));
                    }),
              ),
              const SizedBox(height: 0,),
            ],
          ),
        ),
      ),
    );
  }
}