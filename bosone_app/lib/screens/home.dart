import 'package:bosone_app/screens/nav_bar.dart';
import 'package:bosone_app/screens/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User? user;
  const Home({required this.user});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(),
      body: ProfilePage(user: widget.user),
    );
  }
}
