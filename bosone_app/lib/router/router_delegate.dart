import 'package:bosone_app/router/ui_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../app_state.dart';
import '../screens/dashboard.dart';
import '../screens/authentication/login.dart';
import '../screens/authentication/register.dart';

class BosoneRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  final List<Page> _pages = [];

  final GlobalKey<NavigatorState> navigatorKey;

  final AppState appState;
  BosoneRouterDelegate(this.appState) : navigatorKey = GlobalKey() {
    appState.addListener(() {
      notifyListeners();
    });
  }
  List<MaterialPage> get pages => List.unmodifiable(_pages);
  int numPages() => _pages.length;

  @override
  PageConfiguration get currentConfiguration =>
      _pages.last.arguments as PageConfiguration;
}
