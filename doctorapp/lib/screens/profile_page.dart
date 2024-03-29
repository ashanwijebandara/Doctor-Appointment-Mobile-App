import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorapp/utils/config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

User? loggedInUser;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _auth = FirebaseAuth.instance;
  String? name;
  String? age;
  String? gender;
  String? address;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    loggedInUser = _auth.currentUser!;
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(loggedInUser?.uid)
        .get();

    setState(() {
      name = userSnapshot['username'].toString();

      if (userSnapshot['age'] == null) {
        age = 'Not Set';
        gender = 'Not Set';
        address = 'Not Set';
      } else {
        age = userSnapshot['age'].toString();
        gender = userSnapshot['gender'].toString();
        address = userSnapshot['address'].toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: Config.primaryGradient,
                ),
                child: const Column(children: [
                  Config.spaceSmall,
                  // Text(
                  //   'My Profile',
                  //   style: TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.w800,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  Config.spaceSmall,
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/profile1.jpg'),
                  ),
                  Config.spaceSmall,
                ]),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Column(
                    children: [
                      Card(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: SizedBox(
                          width: 300,
                          height: 185,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'Profile ',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Config.spacehorizontal_medium,
                                    const Text(
                                      'Name        : ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Config.spacehorizontal_medium,
                                    Text(
                                      name ?? '',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Config.spacehorizontal_medium,
                                    const Text(
                                      'Age           : ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Config.spacehorizontal_medium,
                                    Text(
                                      age ?? '',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Config.spacehorizontal_medium,
                                    const Text(
                                      'Gender      : ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Config.spacehorizontal_medium,
                                    Text(
                                      gender ?? '',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Config.spacehorizontal_medium,
                                    const Text(
                                      'Address    : ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Config.spacehorizontal_medium,
                                    Text(
                                      address ?? "",
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('edit_profile');
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        Config.primaryColor, // Text color
                                    side: BorderSide(
                                        color: Config
                                            .primaryColor), // Border color
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          18.0), // Border radius
                                    ),
                                    minimumSize: Size(
                                        100, 30), // button width and height
                                  ),
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Config.spaceSmall,
                      Card(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: SizedBox(
                          width: 300,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text(
                                  'App Details',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.language,
                                      color: Colors.grey,
                                    ),
                                    Config.spacehorizontal_large,
                                    const Text(
                                      'Language   : ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const Text(
                                      'English ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.code,
                                      color: Colors.grey,
                                    ),
                                    Config.spacehorizontal_large,
                                    const Text(
                                      'Version       : ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    const Text(
                                      '2.3 ',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Config.spaceMedium,
                      OutlinedButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushNamed('/');
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Config.primaryColor, // Text color
                          side: BorderSide(
                              color: Config.primaryColor), // Border color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8.0), // Border radius
                          ),
                          minimumSize: Size(300, 40), // button width and height
                        ),
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 16),
                        ),
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
