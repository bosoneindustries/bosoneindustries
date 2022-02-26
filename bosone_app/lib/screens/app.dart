import 'dart:async';
import 'dart:ui';
import 'package:bosone_app/globals.dart' as globals;

import 'package:bosone_app/screens/dashboard.dart';
import 'package:bosone_app/screens/nav_drawer.dart';
import 'package:bosone_app/screens/profile/profile_page.dart';
import 'package:bosone_app/spash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //late User? _currentUser;

  int _selectedIndex = 0; // Index for Bottom Navigation Bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((firebaseUser) {
      if (firebaseUser == null) {
        globals.isLoggedIn = false;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (builder) => const Splash()));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(globals.user),
      appBar: AppBar(
        title: Text("MyApp"),
        backgroundColor: Colors.grey[800],
      ),
      body: SafeArea(
        child: IndexedStack(
          children: [
            Dashboard(),
            ProfilePage(),
          ],
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
