import 'package:bosone_app/models/userModel.dart';
import 'package:bosone_app/screens/authentication/login.dart';
import 'package:bosone_app/screens/profile/edit_user_profile.dart';
import 'package:bosone_app/services/firebase/fire_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bosone_app/globals.dart' as globals;

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const double circleRadius = 50;
  late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: globals.userDocumentStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data == null) {
              print('Snapshot is null');
            }

            if (snapshot.hasError) {
              return const Text('Something went wrong with fetching data');
            }
            //Map data
            print('printing snapshot');
            print(snapshot.data);
            return Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: circleRadius * 3,
                          child: const Image(
                            image: AssetImage('assets/images/cover.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: circleRadius * 2, left: 10.0),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  height: circleRadius * 2,
                                  child: Container(
                                    width: circleRadius * 2,
                                    height: circleRadius * 2,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 2, color: Colors.white)),
                                    child: const Image(
                                      image: AssetImage('assets/bosone.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                  EditUserProfile()));
                                    },
                                    child: Text('Edit'),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: circleRadius * 4.2, left: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hello',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[900]),
                              ),
                              Text(
                                'Mumbai, India',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey[800]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: Colors.grey[200],
                    thickness: 5,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
