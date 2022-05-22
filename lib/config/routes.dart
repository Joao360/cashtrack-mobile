import 'package:flutter/material.dart';
import 'package:cashtrack_mobile/screens/loading/loading_screen.dart';
import 'package:cashtrack_mobile/screens/login/login_screen.dart';

class Routes {
  static final root = '/';
  static final login = '/login';
}

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  Routes.root: (BuildContext context) => LoadingScreen(),
  Routes.login: (BuildContext context) => LoginScreen(),
};