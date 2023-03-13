import 'package:ecommerce/screens/Starting_screen.dart';
import 'package:ecommerce/screens/cart_screen.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/merchant_screen.dart';
import 'package:ecommerce/screens/product_screen.dart';
import 'package:ecommerce/screens/profile_Screen.dart';
import 'package:ecommerce/screens/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_page_src.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  void signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StartScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.fill),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CircleAvatar(
                          radius: 58.0,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 56.0,
                            backgroundImage: NetworkImage(
                                'https://i.postimg.cc/L8FJT4h9/IMG-20221121-175756.jpg'),
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Text(
                            "Lara Croft",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          "lara.croft@gmail.com",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 28.0, top: 4.0),
                          child: Divider(
                            thickness: 1,
                            color: Colors.white54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 0,
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      leading: const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: const Text(
                        "Home",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: const Text(
                        "My Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>const CartScreen()));
                      },
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.delivery_dining_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        "Upcoming Order",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.normal),
                      ),
                      trailing: CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.white,
                        child: Text(
                          "2",
                          style:
                              TextStyle(color: Colors.pinkAccent, fontSize: 12),
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.card_giftcard,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        "Offer Zone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    ListTile(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>MerchantScreen()));
                      },
                      leading: Icon(
                        Icons.sell_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        "Merchant",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.help_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        "Help",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => ProductScreen()));
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.login_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      onTap: () {
                        signOut();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
