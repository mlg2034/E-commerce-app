import 'package:comerce_app/conflig/theme.dart';
import 'package:comerce_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'conflig/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      onGenerateRoute: AppRoute.onGenereateRoute,
      initialRoute: HomeScreen.routeName,
      home: HomeScreen(),
    );
  }
}

