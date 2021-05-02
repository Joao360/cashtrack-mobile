import 'package:flutter/material.dart';

class FormText extends StatelessWidget {
  final Function validator;
  final String labelText;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  FormText({@required this.validator,
    @required this.labelText,
    @required this.controller,
    this.obscureText = false,
    this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
