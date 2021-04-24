import 'package:flutter/material.dart';
import 'package:cashtrack/screens/loading/loading_screen.dart';
import 'package:cashtrack/screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => LoadingScreen(),
  "/login": (BuildContext context) => LoginScreen(),
};