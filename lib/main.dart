import 'package:flutter/material.dart';
import 'package:cashtrack/src/routes.dart';
import 'package:cashtrack/src/screens/login_screen.dart';

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
      home: LoginScreen(),
    );
  }
}
