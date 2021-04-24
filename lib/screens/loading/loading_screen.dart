import 'package:cashtrack/common/cashtrack_api.dart';
import 'package:cashtrack/config/routes.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();

    // Fetch api root and check for stored user credentials
    CashtrackAPI.fetchRoot().whenComplete(() => Navigator.pushNamed(context, Routes.login));

    // TODO check for stored user credentials
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
