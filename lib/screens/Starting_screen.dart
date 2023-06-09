import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/signup_Screen.dart';
import 'package:flutter/material.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key}) : super(key: key);

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://i.postimg.cc/MpCR4S1N/IMG-20221118-102823-1.jpg'),
              fit: BoxFit.fill),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network('https://i.postimg.cc/rwmyWpT9/splash2.png'),
            ),
            const SizedBox(
              height: 12.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.white),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 58),
                  child: Text(
                    "GET STARTED",
                    style: TextStyle(fontSize: 18, color: Colors.pinkAccent),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()));
              },
              child: const Text(
                "SIGN IN",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
