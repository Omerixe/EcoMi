import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mi_sustainability/data/recommendations.dart';

import '../colors.dart';
import '../repository.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late Future<Recommendations> recommendations;

  @override
  void initState() {
    super.initState();
    _loadRecommendations();
  }

  void _loadRecommendations() async {
    recommendations = NetworkRepository().fetchRecommendations();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<Recommendations>(
          future: recommendations,
          builder:
              (BuildContext context, AsyncSnapshot<Recommendations> snapshot) {
            if (snapshot.hasData) {
              var recom = snapshot.data!;
              return Padding(
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
                                        recom.bad[0].image.original,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Text(
                                      recom.bad[0].name,
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/clima_1.svg'),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/animal_4.svg'),
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
                                        recom.good[2].image.original,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Text(recom.good[2].name + '\n'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/clima_1.svg'),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/animal_4.svg'),
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
                                        recom.bad[1].image.original,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Text(
                                      recom.bad[1].name,
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/clima_1.svg'),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/animal_4.svg'),
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
                                        recom.good[1].image.original,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Text(recom.good[1].name + '\n'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/clima_1.svg'),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/animal_4.svg'),
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
                                        recom.bad[2].image.original,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Text(recom.bad[2].name),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/clima_1.svg'),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/animal_4.svg'),
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
                                        recom.good[0].image.original,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                    Text(recom.good[0].name),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/clima_1.svg'),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 50,
                                          child: SvgPicture.asset(
                                              'assets/animal_4.svg'),
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
              );
            } else if (snapshot.hasError) {
              return Text('We have an error :( ${snapshot.error.toString()}');
            } else {
              return Center(
                  child: CircularProgressIndicator(
                color: kPrimaryColor,
              ));
            }
          }),
    ));
  }
}
