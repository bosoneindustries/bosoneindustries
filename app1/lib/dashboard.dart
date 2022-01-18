import 'package:flutter/material.dart';

import 'nav_bar/sections.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key, required this.destination}) : super(key: key);

  final Section destination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination.title),
      ),
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/list");
          },
        ),
      ),
    );
  }
}
