import 'package:flutter/material.dart';

class RoundedEdgesContainer extends StatelessWidget {

  RoundedEdgesContainer({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxWidth: 500),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        margin: const EdgeInsets.symmetric(horizontal: 32),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: child,
        )
    );
  }
}
