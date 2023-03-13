import 'package:ecommerce/screens/Starting_screen.dart';
import 'package:ecommerce/screens/home_page_src.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        decoration:const BoxDecoration(image:
        DecorationImage(image:
        NetworkImage('https://i.postimg.cc/MpCR4S1N/IMG-20221118-102823-1.jpg'),fit: BoxFit.fill ),),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Image.network('https://i.postimg.cc/fbLKYPf1/splash-logo.png'),
            ),
            const SizedBox(height: 12.0,),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>const HomePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0,horizontal: 58),
                  child: Text("GET STARTED",style: TextStyle(fontSize: 18,color: Colors.pinkAccent),),
                ),
              ),
            ),
            TextButton(onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const StartingScreen()));
            }, child:const Text("SIGN IN",style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ],
        ),
      )),
    );
  }
}
