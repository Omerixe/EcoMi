import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import 'data/customer.dart';

abstract class Repository {
  Future<Customer> fetchCustomer();

  Future<Purchase> fetchPurchase(String customerId, String purchaseId);
}

class NetworkRepository implements Repository {
  static const String url = 'https://www.example.com';

  @override
  Future<Customer> fetchCustomer() async {
    final response = await http.get(Uri.parse(url + '/customer'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Future<Purchase> fetchPurchase(String customerId, String purchaseId) async {
    final response = await http.get(Uri.parse(url + '/purchase'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Purchase.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class LocalRepository implements Repository {
  @override
  Future<Customer> fetchCustomer() async {
    final response = await rootBundle.loadString('assets/customer.json');
    return Customer.fromJson(jsonDecode(response));
  }

  @override
  Future<Purchase> fetchPurchase(String customerId, String purchaseId) async {
    final response = await rootBundle.loadString('assets/purchase.json');
    return Purchase.fromJson(jsonDecode(response));
  }
}
