import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import 'data/customer.dart';

abstract class Repository {
  Future<Customer> fetchCustomer(String customerId);

  Future<Cart> fetchCart(String customerId, String purchaseId);
}

class NetworkRepository implements Repository {
  static const String url = 'https://sustain-api.azurewebsites.net';

  @override
  Future<Customer> fetchCustomer(String customerId) async {
    final response =
        await http.get(Uri.parse(url + '/customer?customer_id=$customerId'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Customer.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load customer');
    }
  }

  @override
  Future<Cart> fetchCart(String customerId, String purchaseId) async {
    final response = await http.get(Uri.parse(url + '/cart'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Cart.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load cart');
    }
  }
}

class LocalRepository implements Repository {
  @override
  Future<Customer> fetchCustomer(String customerId) async {
    final response = await rootBundle.loadString('assets/customer.json');
    return Customer.fromJson(jsonDecode(response));
  }

  @override
  Future<Cart> fetchCart(String customerId, String purchaseId) async {
    final response = await rootBundle.loadString('assets/cart.json');
    return Cart.fromJson(jsonDecode(response));
  }
}
