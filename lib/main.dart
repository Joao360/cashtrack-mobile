import 'package:flutter/material.dart';
import 'package:cashtrack/routes.dart';
import 'package:cashtrack/screens/login_screen.dart';

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
