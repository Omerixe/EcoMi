import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_sustainability/data/customer.dart';

import '../repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Customer> customer;

  @override
  void initState() {
    super.initState();
    loadCustomer();
  }

  void loadCustomer() async {
    customer = NetworkRepository().fetchCustomer('cus1');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Mi Sustainability')),
      body: FutureBuilder<Customer>(
        future: customer,
        builder: (BuildContext context, AsyncSnapshot<Customer> snapshot) {
          if (snapshot.hasData) {
            var customer = snapshot.data!;
            return Column(children: [
              Text('Hello ${customer.name}!'),
              /*Expanded(
                child: ListView.builder(
                    itemCount: customer.carts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Carts: ${customer.carts[index].id}'),
                              Text(
                                '${customer.carts[index].score}',
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )*/
            ]);
          } else if (snapshot.hasError) {
            return Text('We have an error :( ${snapshot.error.toString()}');
          } else {
            return Text('Loading...');
          }
        },
      ),
    ));
  }
}
