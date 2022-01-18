import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Section {
  const Section(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Section> allDestinations = <Section>[
  Section('Home', Icons.home),
  Section('Profile', Icons.person),
];
