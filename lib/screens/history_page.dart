import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'From your last 30 days of purchase',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.red,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://image.migros.ch/original/453f6ac0fe6de04ad0c408fd7b98e522572ab6c2/heidi-vollrahm.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text('Heidi Vollrahm'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.asset('assets/clima_1.svg'),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      SvgPicture.asset('assets/animal_4.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://image.migros.ch/original/453f6ac0fe6de04ad0c408fd7b98e522572ab6c2/heidi-vollrahm.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text('Heidi Vollrahm'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.asset('assets/clima_1.svg'),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      SvgPicture.asset('assets/animal_4.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.red,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://image.migros.ch/original/453f6ac0fe6de04ad0c408fd7b98e522572ab6c2/heidi-vollrahm.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text('Heidi Vollrahm'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.asset('assets/clima_1.svg'),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      SvgPicture.asset('assets/animal_4.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://image.migros.ch/original/453f6ac0fe6de04ad0c408fd7b98e522572ab6c2/heidi-vollrahm.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text('Heidi Vollrahm'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.asset('assets/clima_1.svg'),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      SvgPicture.asset('assets/animal_4.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.red,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://image.migros.ch/original/453f6ac0fe6de04ad0c408fd7b98e522572ab6c2/heidi-vollrahm.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text('Heidi Vollrahm'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.asset('assets/clima_1.svg'),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      SvgPicture.asset('assets/animal_4.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.green,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image.network(
                                'https://image.migros.ch/original/453f6ac0fe6de04ad0c408fd7b98e522572ab6c2/heidi-vollrahm.jpg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            Text('Heidi Vollrahm'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  child: SvgPicture.asset('assets/clima_1.svg'),
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                  child:
                                      SvgPicture.asset('assets/animal_4.svg'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
