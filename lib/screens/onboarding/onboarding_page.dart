import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
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

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: 'This is the first onboarding screen',
          body: 'We can have some nice text describing everything',
          image: Image.asset('assets/placeholder.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'This is the second onboarding screen',
          body: 'We can have some nice text describing everything',
          image: Image.asset('assets/placeholder.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: 'This is the third onboarding screen',
          body: 'We can have some nice text describing everything',
          image: Image.asset('assets/placeholder.png'),
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
    );
  }
}
