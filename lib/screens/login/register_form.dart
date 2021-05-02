import 'package:cashtrack/common/utils/form_validators.dart';
import 'package:cashtrack/common/widgets/form_text.dart';
import 'package:cashtrack/common/widgets/rounded_edges_container.dart';
import 'package:cashtrack/res/colors.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final onRegister;

  RegisterForm({@required this.onRegister});

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPwdController = TextEditingController();

  void _onRegister() {
    if (_formKey.currentState.validate()) {
      widget.onRegister(nameController.text, emailController.text, passwordController.text);
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
                controller: nameController,
                labelText: 'Name',
                validator: nameValidator,
              ),
              FormText(
                controller: emailController,
                labelText: 'Email',
                validator: emailValidator,
              ),
              FormText(
                controller: passwordController,
                obscureText: true,
                labelText: 'Password',
                validator: passwordValidator,
              ),
              FormText(
                controller: repeatPwdController,
                obscureText: true,
                labelText: 'Repeat Password',
                validator: passwordValidator,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 250, height: 40),
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )
                        ),
                        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                        foregroundColor: MaterialStateProperty.all(Colors.white)
                    ),
                    onPressed: _onRegister,
                    child: Text('Sign up'),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
