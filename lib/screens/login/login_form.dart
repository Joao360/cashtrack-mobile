import 'package:flutter/material.dart';

import 'package:cashtrack/common/widgets/form_text.dart';
import 'package:cashtrack/common/widgets/rounded_edges_container.dart';
import 'package:cashtrack/common/utils/form_validators.dart';

class LoginForm extends StatefulWidget {
  final Function onRegister;
  final Function onLogin;

  LoginForm({@required this.onRegister, @required this.onLogin});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      widget.onLogin(emailController.text, passwordController.text);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RoundedEdgesContainer(
        child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          FormText(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
            validator: emailValidator,
          ),
          FormText(
            controller: passwordController,
            obscureText: true,
            labelText: 'Password',
            validator: passwordValidator,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: ElevatedButton(
              onPressed: _onSubmit,
              child: Text('Login'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: ElevatedButton(
              onPressed: widget.onRegister,
              child: Text('Register'),
            ),
          ),
        ],
      ),
    ));
  }
}
