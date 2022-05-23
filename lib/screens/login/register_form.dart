import 'package:cashtrack_mobile/common/utils/form_validators.dart';
import 'package:cashtrack_mobile/common/widgets/form_text.dart';
import 'package:cashtrack_mobile/common/widgets/rounded_edges_container.dart';
import 'package:cashtrack_mobile/res/colors.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  final onRegister;

  const RegisterForm({Key? key, required this.onRegister}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPwdController = TextEditingController();

  void _onRegister() {
    if (_formKey.currentState?.validate() == true) {
      widget.onRegister(nameController.text, emailController.text, passwordController.text);
    }
  }

  String? repeatPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }

    return null;
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
                labelText: 'Confirm Password',
                validator: repeatPasswordValidator,
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
