import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  //final String title;
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Dashboard'),
        Image(image: AssetImage('assets/bosone.png')),
      ]),
    );
  }
}
