import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/home_page_src.dart';

import 'package:ecommerce/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mbl = TextEditingController();
  TextEditingController password = TextEditingController();


  void signUp(BuildContext context)async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text)
        .catchError((onError){

    }).then((authUser){
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomePage()));

    });
    String uid=FirebaseAuth.instance.currentUser!.uid.toString();
    await FirebaseFirestore.instance
        .collection("Users").doc(uid)
        .set({"name": userName.text, "email": email.text, "mobile": mbl.text});

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.postimg.cc/MpCR4S1N/IMG-20221118-102823-1.jpg'),
                          fit: BoxFit.fill),
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://i.postimg.cc/c1cjh2cx/ramni-logo.png'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .75,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  thickness: 1,
                                  color: Colors.black26,
                                )),
                                Text(
                                  "  SIGN UP  ",
                                  style: TextStyle(
                                      color: Colors.pinkAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 1,
                                  color: Colors.black26,
                                )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                            child: Column(
                              children: [
                                TextInputField.customTextForm(
                                    TextInputType.text,
                                    "Enter Name",
                                    false,
                                    null,
                                    "Bruce wayne", (useName) {
                                  if (useName.isEmpty)
                                    return "Please Enter your Name";
                                  else
                                    return null;
                                }, userName),
                                SizedBox(
                                  height: 12,
                                ),
                                TextInputField.customTextForm(
                                    TextInputType.emailAddress,
                                    "Email",
                                    false,
                                    null,
                                    "bruce.wayne@gmail.com", (email) {
                                  if (email.isEmpty)
                                    return "Please Enter Email";
                                  else
                                    return null;
                                },email),
                                SizedBox(
                                  height: 12,
                                ),
                                TextInputField.customTextForm(
                                    TextInputType.number,
                                    "Enter Mobile",
                                    false,
                                    null,
                                    null, (mbl) {
                                  if (mbl.isEmpty)
                                    return "Please Enter Mobile Number";
                                  else
                                    return null;
                                },mbl),
                                SizedBox(
                                  height: 12,
                                ),
                                TextInputField.customTextForm(
                                    TextInputType.text,
                                    "Password",
                                    true,
                                    Icon(Icons.remove_red_eye_outlined),
                                    null, (pass) {
                                  if (pass.isEmpty)
                                    return "Please Enter Password";
                                  else if (pass.length < 8)
                                    return "Password lenth is low";
                                  return null;
                                },password),
                                SizedBox(
                                  height: 12,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                signUp(context);
                                // saveData()
                              //  1. take current user id and add it on users collection
                              //  2. Store all the details after user id on users collection
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40.0),
                                  color: Colors.pinkAccent),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 17.0, horizontal: 78),
                                child: Text(
                                  "Save",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
