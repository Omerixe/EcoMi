import 'package:flutter/material.dart';
import 'package:mi_sustainability/screens/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'colors.dart';
import 'screens/home_page.dart';

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
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
            minimumSize: Size(double.infinity, 45),
          ),
        ),
      ),
      home: onboardingDone ? HomePage() : OnboardingPage(),
    );
  }
}
