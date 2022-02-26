import 'package:bosone_app/screens/authentication/login.dart';
import 'package:bosone_app/screens/app.dart';
import 'package:bosone_app/screens/profile/profile_page.dart';
import 'package:bosone_app/services/firebase/fire_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'globals.dart' as globals;

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  Future<FirebaseApp> _initializeFirebase(BuildContext context) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    //Initialize Firebase servinces
    globals.user = FirebaseAuth.instance.currentUser;
    globals.firestore = FirebaseFirestore.instance;
    //check user, if not null forward to app.
    if (globals.user != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (builder) => App()));
      globals.isLoggedIn = true;
    }

    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Login();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
