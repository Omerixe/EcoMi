import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mi_sustainability/data/customer.dart';

import '../colors.dart';
import '../repository.dart';

class PurchasesPage extends StatefulWidget {
  @override
  State<PurchasesPage> createState() => _PurchasesPageState();
}

class _PurchasesPageState extends State<PurchasesPage> {
  late Future<Customer> customer;

  @override
  void initState() {
    super.initState();
    loadCustomer();
  }

  void loadCustomer() async {
    customer = LocalRepository().fetchCustomer('100688');
  }

  @override
  Widget build(BuildContext context) {
    String _getDateFromUnix(int timestamp) {
      var dt = DateTime.fromMillisecondsSinceEpoch(timestamp);
      return DateFormat('d. MMMM yyyy').format(dt);
    }

    String _getRoundedScore(double score) {
      var roundedScore = ((score * 2).round() / 2);
      var format = NumberFormat("0.#");
      return format.format(roundedScore);
    }

    String? _getMotivationalText(double score) {
      if (score >= 4) {
        return '🎉 Well done!';
      } else if (score < 3.5) {
        return 'Don\'t give up';
      } else {
        return null;
      }
    }

    return SafeArea(
        child: Scaffold(
      body: FutureBuilder<Customer>(
        future: customer,
        builder: (BuildContext context, AsyncSnapshot<Customer> snapshot) {
          if (snapshot.hasData) {
            var customer = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Text(
                  'Your Purchases',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: customer.purchases.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {},
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _getDateFromUnix(customer
                                            .purchases[index].unixTimeStamp),
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                      Text(
                                        _getRoundedScore(customer
                                            .purchases[index].climateScore),
                                        style: TextStyle(
                                          fontSize: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  _getMotivationalText(customer
                                              .purchases[index].climateScore) !=
                                          null
                                      ? Text(_getMotivationalText(customer
                                          .purchases[index].climateScore)!)
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ]),
            );
          } else if (snapshot.hasError) {
            return Text('We have an error :( ${snapshot.error.toString()}');
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            ));
          }
        },
      ),
    ));
  }
}
