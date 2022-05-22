import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cashtrack_mobile/config/theme.dart';
import 'package:cashtrack_mobile/state/app_state.dart';
import 'package:cashtrack_mobile/config/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
