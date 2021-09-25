import 'package:flutter/material.dart';
import 'package:mi_sustainability/screens/home_page.dart';

import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Sustainability',
      theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(
            color: kPrimaryColor,
          )),
      home: HomePage(),
    );
  }
}
