import 'package:flutter/material.dart';

Future<void> showErrorDialog(BuildContext context, dynamic error) async {
  List<Widget> errorMessages = [];

  if (error.message is Map) {
    error.message.forEach((key, value) {
      value.forEach((error) => errorMessages.add(Text(error)));
    });
  } else {
    errorMessages.add(Text(error.message));
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Oops! An error occurred'),
        content: SingleChildScrollView(
          child: ListBody(
            children: errorMessages,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}