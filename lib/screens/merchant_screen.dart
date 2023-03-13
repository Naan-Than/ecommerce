import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({Key? key}) : super(key: key);

  @override
  State<MerchantScreen> createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController productTitle = TextEditingController();
  TextEditingController productDescription = TextEditingController();
  TextEditingController productPrice = TextEditingController();

  late File? _image;
  bool _load = false;

  Future imagePicker() async {
    final picker = ImagePicker();
    final pick = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
        _load = false;
      }
    });
  }

  Future uploadImage() async {
    String url;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('Images')
        .child("image1${DateTime.now()}");
    await reference.putFile(_image!);
    url = await reference.getDownloadURL();


    var docRef=await FirebaseFirestore.instance.collection("Products").add({

      });
    String docId=docRef.id;
    await FirebaseFirestore.instance.collection("Products").doc(docId).set({
      "pID":docId,
      "name": productTitle.text,
      "price": productPrice.text,
      "description": productDescription.text,
      "image": url,

    }).whenComplete(() => clearForm());
  }
  void clearForm(){
    productDescription.clear();
    productPrice.clear();
    productTitle.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0.5,
        title: const Text(
          "Merchant",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                      "Enter the Product Details",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Title:",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 6,
                ),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: TextFormField(
                      controller: productTitle,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the Title';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Description:",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: SizedBox(
                    height: 130,
                    width: 300,
                    child: TextFormField(
                      controller: productDescription,
                      keyboardType: TextInputType.text,
                      maxLines: 5,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter the Product Description';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Price:",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 6,
                ),
                Center(
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: TextFormField(
                      controller: productPrice,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter the Product Price';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black54)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Image:",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                const SizedBox(
                  height: 6,
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.black54)),
                    child: Column(
                      children: [
                        Expanded(
                          child: _image != null
                              ? Image.file(_image!)
                              : const Center(child: Text("no image selected")),
                        ),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent),
                            onPressed: () {
                              imagePicker();
                            },
                            child: const Text("Choose"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                clearForm();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.pinkAccent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 17.0, horizontal: 45),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Clear",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  uploadImage();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    color: Colors.pinkAccent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 17.0, horizontal: 45),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.upload_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "Upload",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
