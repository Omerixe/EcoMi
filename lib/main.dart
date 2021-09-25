import 'package:flutter/material.dart';
import 'package:mi_sustainability/screens/home_page.dart';
import 'package:mi_sustainability/screens/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';

late bool onboardingDone;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  onboardingDone = prefs.containsKey('onboardingDone');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Sustainability',
      theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
          appBarTheme: AppBarTheme(
            color: kPrimaryColor,
          )),
      home: onboardingDone ? HomePage() : OnboardingPage(),
    );
  }
}
