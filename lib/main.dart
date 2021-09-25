import 'package:flutter/material.dart';
import 'package:mi_sustainability/screens/home_page.dart';

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
          primaryColor: Color(0xffFF6600),
          appBarTheme: AppBarTheme(
            color: Color(0xffFF6600),
          )),
      home: HomePage(),
    );
  }
}
