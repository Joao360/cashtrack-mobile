import 'package:cashtrack/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:cashtrack/config/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cashtrack',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: AppColors.secondaryColor,
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}
