import 'package:ecommerce/screens/home_page_src.dart';
import 'package:ecommerce/utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void signIn(BuildContext context) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text)
        .catchError((onError){

    }).then((authUser) {
      // await FirebaseAuth.instance.currentUser.uid
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomePage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://i.postimg.cc/MpCR4S1N/IMG-20221118-102823-1.jpg'),
                        fit: BoxFit.fill),
                  ),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                            'https://i.postimg.cc/c1cjh2cx/ramni-logo.png'),
                        Image.network(
                            'https://i.postimg.cc/X7F9bGsQ/ramni-text.png'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .5,
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
                          height: 8.0,
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
                                "  SIGN IN  ",
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
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          child: Column(
                            children: [
                              TextInputField.customTextForm(
                                  TextInputType.emailAddress,
                                  "Email",
                                  false,
                                  null,
                                  "bruce.wayne@gmail.com",
                                      (email){
                                    if(email.isEmpty)
                                      return "Please Enter Email";
                                    else
                                      return null;
                                  },
                                  email),
                              SizedBox(
                                height: 12,
                              ),
                              TextInputField.customTextForm(
                                  TextInputType.text,
                                  "Password",
                                  true,
                                  Icon(Icons.remove_red_eye_outlined),
                                  null,
                                      (pass){
                                    if(pass.isEmpty)
                                      return "Please Enter Password";
                                    else if (pass.length<8)
                                      return "Password lenth is low";
                                    return null;
                                  },
                                  password
                                  ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            if(formKey.currentState!.validate()){
                              signIn(context);
                            }},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                color: Colors.pinkAccent),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 17.0, horizontal: 78),
                              child: Text(
                                "SIGN IN",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
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
    );
  }
}
