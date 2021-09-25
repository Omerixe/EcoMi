import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mi_sustainability/data/customer.dart';

import '../repository.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Customer? customer = null;

  @override
  void initState() {
    loadCustomer();
  }

  void loadCustomer() async {
    customer = await LocalRepository().fetchCustomer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text('Mi Sustainability')),
      body: Column(
        children: customer == null
            ? [
                Text('Loading...'),
              ]
            : [
                Text('We do have a customer ${customer!.id}'),
              ],
      ),
    ));
  }
}
