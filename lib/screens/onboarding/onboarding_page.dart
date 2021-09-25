import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mi_sustainability/colors.dart';
import 'package:mi_sustainability/screens/onboarding/onboarding_preferences_page.dart';

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
      imagePadding: EdgeInsets.only(top: 16),
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        pages: [
          PageViewModel(
            title: '',
            bodyWidget: RichText(
              text: TextSpan(
                text: 'Average ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'food consumption footprint is ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: '1070kg CO2 (per year, per person)',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: '\n\nEquivalent to ',
                  ),
                  TextSpan(
                    text: '5000km car journey,  from Norway to Morocco!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            image: Image.asset('assets/onboarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: '',
            bodyWidget: RichText(
              text: TextSpan(
                text: 'Agriculture uses ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '70% of the fresh water supply ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: '\n\nEquivalent to ',
                  ),
                  TextSpan(
                    text: '182L of water (per day, per person)',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            image: Image.asset('assets/onboarding2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: '',
            bodyWidget: RichText(
              text: TextSpan(
                text: 'Animal agriculture is the leading cause of ',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'extinction, ocean dead zones, water pollution.',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            image: Image.asset('assets/onboarding3.png'),
            decoration: pageDecoration,
            footer: ElevatedButton(
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnboardingPreferencesPage()),
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
