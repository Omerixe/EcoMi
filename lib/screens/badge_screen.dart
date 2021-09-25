import 'package:flutter/material.dart';

import 'purchases_page.dart';

class BadgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 150),
            Expanded(
              child: Column(
                children: [
                  Image.asset('assets/badge1.png'),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Let’s create a more sustainable future together !',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PurchasesPage()),
                  );
                },
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
