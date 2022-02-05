import 'package:bosone_app/spash.dart';
import 'package:flutter/material.dart';

const String SplashPath = '/Splash';
const String LoginPath = '/login';
const String SignupPath = '/signup';
const String HomePath = '/home';
const String MyProfilePath = '/login';

enum Pages {
  Splash,
  Login,
  Signup,
  Home,
  MyProfile,
}

class PageConfiguration {
  final String key;
  final String path;
  final Pages uiPage;
  PageConfiguration(
      {required this.key, required this.path, required this.uiPage});
}

PageConfiguration wrapperPageConfig =
    PageConfiguration(key: 'Splash', path: SplashPath, uiPage: Pages.Splash);
PageConfiguration loginPageConfig =
    PageConfiguration(key: 'Login', path: LoginPath, uiPage: Pages.Login);
PageConfiguration signupPageConfig =
    PageConfiguration(key: 'Signup', path: SignupPath, uiPage: Pages.Signup);
PageConfiguration homepageConfig =
    PageConfiguration(key: 'Home', path: HomePath, uiPage: Pages.Home);
