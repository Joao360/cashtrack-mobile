import 'package:cashtrack/src/utils/formValidators.dart';
import 'package:cashtrack/src/widgets/FormText.dart';
import 'package:cashtrack/src/widgets/RoundedEdgesContainer.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return RoundedEdgesContainer(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormText(
                labelText: 'Name',
                validator: nameValidator,
              ),
              FormText(
                labelText: 'Email',
                validator: emailValidator,
              ),
              FormText(
                obscureText: true,
                labelText: 'Password',
                validator: passwordValidator,
              ),
              FormText(
                obscureText: true,
                labelText: 'Repeat Password',
                validator: passwordValidator,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ElevatedButton(
                  child: Text('Sign up'),
                ),
              ),
            ],
          ),
        )
    );
  }
}
