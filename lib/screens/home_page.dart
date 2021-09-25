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
    customer = LocalRepository().fetchCustomer();
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
            return Text('We have data!');
          } else if (snapshot.hasError) {
            return Text('We have an error :(');
          } else {
            return Text('Loading...');
          }
        },
      ),
    ));
  }
}
