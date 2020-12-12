import 'package:flutter/material.dart';

final emailValidationRegExp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

class LoginForm extends StatefulWidget {
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

  String _emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(emailValidationRegExp).hasMatch(value)) {
      return 'Email is invalid';
    }
    return null;
  }

  String _passwordValidator(value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: _emailValidator,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: _passwordValidator,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  onPressed: _onSubmit,
                  child: Text('Login'),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
