import 'package:app1/nav_bar/sections.dart';
import 'package:app1/dashboard.dart';
import 'package:app1/text_page.dart';
import 'package:flutter/material.dart';

import '../list_page.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({Key? key, required this.destination})
      : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController =
        TextEditingController(text: 'sample text: ${widget.destination.title}');
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
                  return Dashboard(destination: widget.destination);
                case '/list':
                  return ListPage(destination: widget.destination);
                case '/text':
                  return TextPage(destination: widget.destination);
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
