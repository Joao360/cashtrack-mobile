import 'package:flutter/material.dart';
import 'package:cashtrack/config/routes.dart';
import 'package:cashtrack/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashtrack',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.teal,
      ),
      routes: routes,
      initialRoute: "/login",
    );
  }
}
