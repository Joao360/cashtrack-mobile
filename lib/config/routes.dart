import 'package:flutter/material.dart';
import 'package:cashtrack/screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
};