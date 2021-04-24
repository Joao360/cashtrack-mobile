import 'package:cashtrack/common/cashtrack_api.dart';
import 'package:cashtrack/domain/model/root.dart';
import 'package:cashtrack/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cashtrack/screens/login/login_form.dart';
import 'package:cashtrack/screens/login/register_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoginForm = true;

  void toggleForms() {
    setState(() {
      isLoginForm = !isLoginForm;
    });
  }

  void onLogin(String username, String password) async {
    try {
      var user = await CashtrackAPI.login(username, password);
      var state = context.read<AppState>();
      state.setUser(user);
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: isLoginForm
                          ? LoginForm(
                              onLogin: onLogin,
                              onRegister: toggleForms,
                            )
                          : RegisterForm(),
                    )
                  ]),
              if (!isLoginForm)
                Positioned(
                    top: 8,
                    left: 8,
                    child: IconButton(
                      onPressed: toggleForms,
                      icon: Icon(Icons.arrow_back),
                    ))
            ],
          ),
        ));
  }
}
