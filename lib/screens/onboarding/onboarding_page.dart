import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mi_sustainability/colors.dart';
import 'package:mi_sustainability/screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingState();
}

class _OnboardingState extends State<OnboardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: '',
            body:
                'Average yearly food consumption footprint is 1070kg CO2 eq / capita\n\nEquivalent to a road trip from Norway to Morocco',
            image: Image.asset('assets/onboarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: '',
            body:
                'Agriculture uses 70% of the fresh water supply\n\nEquivalent to 13000L of water / capita ',
            image: Image.asset('assets/onboarding2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: '',
            body:
                'Animal agriculture is the leading cause of species extinction, ocean dead zones, water pollution.',
            image: Image.asset('assets/onboarding3.png'),
            decoration: pageDecoration,
            footer: ElevatedButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('onboardingDone', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: const Text("Let's Go !"),
            ),
          ),
        ],
        showDoneButton: false,
        showNextButton: false,
        showSkipButton: false,
        dotsDecorator: DotsDecorator(
          color: Colors.grey,
          activeColor: kPrimaryColor,
        ),
      ),
    );
  }
}
