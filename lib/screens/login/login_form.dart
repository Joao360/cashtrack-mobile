import 'package:flutter/material.dart';
import 'package:cashtrack_mobile/res/colors.dart';

import 'package:cashtrack_mobile/common/widgets/form_text.dart';
import 'package:cashtrack_mobile/common/widgets/rounded_edges_container.dart';
import 'package:cashtrack_mobile/common/utils/form_validators.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onRegister;
  final Function onLogin;

  const LoginForm({Key? key, required this.onRegister, required this.onLogin}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
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
    if (_formKey.currentState?.validate() == true) {
      widget.onLogin(emailController.text, passwordController.text);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  var t = TextButton.styleFrom(primary: Colors.white, backgroundColor: AppColors.primaryColor);

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
            padding: const EdgeInsets.only(top: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 250, height: 40),
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
                onPressed: _onSubmit,
                child: const Text('Login'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints.tightFor(width: 250, height: 40),
              child: OutlinedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1)
                        )
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.black)
                ),
                onPressed: widget.onRegister,
                child: const Text('Register'),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
