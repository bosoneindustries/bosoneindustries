import 'package:app1/nav_bar/sections.dart';
import 'package:app1/dashboard.dart';
import 'package:app1/text_page.dart';
import 'package:flutter/material.dart';

import '../list_page.dart';

class SectionView extends StatefulWidget {
  const SectionView({Key? key, required this.section}) : super(key: key);

  final Section section;

  @override
  _SectionViewState createState() => _SectionViewState();
}

class _SectionViewState extends State<SectionView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              switch (settings.name) {
                case '/':
                  return Dashboard(destination: widget.section);
                case '/list':
                  return ListPage(destination: widget.section);
                case '/text':
                  return TextPage(destination: widget.section);
              }
              return Text('Error 404');
            });
      },
    );

    @override
    void dispose() {
      _textController.dispose();
      super.dispose();
    }
  }
}
