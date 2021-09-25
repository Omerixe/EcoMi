import 'package:flutter/material.dart';
import 'package:mi_sustainability/screens/badge_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../colors.dart';
import '../../repository.dart';

class OnboardingPreferencesPage extends StatefulWidget {
  @override
  _OnboardingPreferencesPageState createState() =>
      _OnboardingPreferencesPageState();
}

class _OnboardingPreferencesPageState extends State<OnboardingPreferencesPage> {
  double _currentCo2SliderValue = 100.0;
  double _currentWaterSliderValue = 100.0;
  double _currentAnimalSliderValue = 100.0;

  String _getSliderText(double value) {
    var roundedValue = value.round();
    if (roundedValue <= 75 && roundedValue >= 25) {
      return 'Somewhat  important for me';
    } else if (roundedValue > 75) {
      return 'Extremly important for me';
    } else {
      return 'Not important for me';
    }
  }

  Color _getSliderColor(double value) {
    var roundedValue = value.round();
    if (roundedValue <= 75 && roundedValue >= 25) {
      return kPrimaryColor;
    } else if (roundedValue > 75) {
      return kGreen;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'How important is this to you?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                  'We will use this to recommend the most relevant products for you'),
              SizedBox(
                height: 40,
              ),
              Text(
                'Carbon footprint',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/co2_icon.png'),
                  Expanded(
                    child: Slider(
                      value: _currentCo2SliderValue,
                      min: 0,
                      max: 100,
                      activeColor: _getSliderColor(_currentCo2SliderValue),
                      inactiveColor: _getSliderColor(_currentCo2SliderValue),
                      label: _currentCo2SliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentCo2SliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _getSliderText(_currentCo2SliderValue),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Water Scarcity',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/water_icon.png'),
                  Expanded(
                    child: Slider(
                      value: _currentWaterSliderValue,
                      min: 0,
                      max: 100,
                      activeColor: _getSliderColor(_currentWaterSliderValue),
                      inactiveColor: _getSliderColor(_currentWaterSliderValue),
                      label: _currentWaterSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentWaterSliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _getSliderText(_currentWaterSliderValue),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Animal Welfare',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/animal_icon.png'),
                  Expanded(
                    child: Slider(
                      value: _currentAnimalSliderValue,
                      min: 0,
                      max: 100,
                      activeColor: _getSliderColor(_currentAnimalSliderValue),
                      inactiveColor: _getSliderColor(_currentAnimalSliderValue),
                      label: _currentAnimalSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentAnimalSliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _getSliderText(_currentAnimalSliderValue),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      var prefs = await SharedPreferences.getInstance();
                      prefs.setBool('onboardingDone', true);
                      NetworkRepository().customize(
                          '100688',
                          _currentCo2SliderValue,
                          _currentWaterSliderValue,
                          _currentAnimalSliderValue);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => BadgeScreen()),
                      );
                    },
                    child: const Text('Start'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
