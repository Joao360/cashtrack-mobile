import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cashtrack/config/theme.dart';
import 'package:cashtrack/state/app_state.dart';
import 'package:cashtrack/config/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Cashtrack',
        theme: appTheme,
        routes: routes,
        initialRoute: "/",
      ),
    );
  }
}
