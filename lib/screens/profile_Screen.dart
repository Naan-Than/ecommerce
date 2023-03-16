import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Color textColor = const Color(0xffe3b59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg.jpg'),
                    fit: BoxFit.fill),
              ),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "My Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 12, right: 12),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                                color: Colors.redAccent, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 74.0,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 72.0,
                        backgroundImage: AssetImage('assets/images/dp.jpg')),
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      "Lara Croft",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "lara.croft@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                  ],
                ),
                Positioned(
                    bottom: 0.0,
                    top: 0.0,
                    child: Container(
                      height: MediaQuery.of(context).size.height * .44,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 8.0),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.delivery_dining),
                                title: const Text(
                                  "Upcoming Orders",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.grey.shade200,
                                    child: const Text("2",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Card(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const ListTile(
                                leading: Icon(Icons.location_on_outlined),
                                title: Text(
                                  "Manage Address",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Card(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const ListTile(
                                leading: Icon(Icons.payment),
                                title: Text(
                                  "Update Payment",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Card(
                              color: Colors.grey.shade50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const ListTile(
                                leading: Icon(Icons.chat_bubble_outline),
                                title: Text(
                                  "My Chat",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
