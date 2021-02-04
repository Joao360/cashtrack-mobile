import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final Function validator;
  final String labelText;
  final bool obscureText;

  FormText({ @required this.validator, @required this.labelText, this.obscureText = false });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
