import 'package:cashtrack/common/widgets/form_text.dart';
import 'package:flutter/material.dart';
import 'package:cashtrack/common/widgets/rounded_edges_container.dart';
import 'package:cashtrack/common/utils/form_validators.dart';

class LoginForm extends StatefulWidget {

  LoginForm({@required this.onRegister});
  final Function onRegister;

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

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      Scaffold
          .of(context)
          .showSnackBar(SnackBar(content: Text('Processing Data')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return RoundedEdgesContainer(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FormText(
              labelText: 'Email',
              validator: emailValidator,
            ),
            FormText(
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
      )
    );
  }
}
