import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List<String>chipList=[
    'All',
    'Electronics',
    'Appliances',
    'Shirt',
    'Men',
    'Cosmetics',
  ];


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.notifications, color: Colors.black54, size: 28),
                SizedBox(
                  width: 16,
                ),
                Icon(
                  Icons.shopping_cart,
                  color: Colors.black54,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: width / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.3), width: 1),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        fillColor: Colors.grey,
                        focusColor: Colors.grey,
                        border: InputBorder.none,
                        labelText: "Search",
                        prefixIcon: Icon(Icons.search),
                      ),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 45,
                    width: width / 9,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.3), width: 1),
                    ),
                    child: const Icon(Icons.filter_alt_outlined,color: Colors.black54,),),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("TRENDING PRODUCTS ",style:TextStyle(color: Colors.black,),),
                    Divider(thickness: 2,color: Colors.grey,),
                    Text("See all",style:TextStyle(color: Colors.redAccent,),),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildProduct(context);
                },
                itemCount: 10,
              ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Expanded(
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("POPULAR CATEGORIES ",style:TextStyle(color: Colors.black,),),
                    Divider(thickness: 2,color: Colors.grey,),
                    Text("See all",style:TextStyle(color: Colors.redAccent,),),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16,),
            SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return Chip(
                      backgroundColor: Colors.black12,
                      label: Text(chipList[index],

                      ),
                    );
                  }
              ),
            ),

          ],
        ),
      ),
    );
  }
  //continue ok
  buildProduct(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network("https://trimurtikitchenequipmentkop.com/images/products/furniture/chaire.png", height: 100, width: 160,),
          const Text("Onyx Ortho Chair "),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("3500"),
              SizedBox(width: 16,),
              CircleAvatar(
                radius: 12,
                child: Icon(Icons.add_shopping_cart, size: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}


