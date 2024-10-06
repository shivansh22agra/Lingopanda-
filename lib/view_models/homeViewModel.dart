import 'dart:convert';

import 'package:boomer/models/movies.dart';
import 'package:boomer/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeViewModel extends ChangeNotifier {
  Product productsData = Product();
  bool isLoading = false;

  Future fetchProducts() async {
    isLoading = true;
    notifyListeners();
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      productsData = Product.fromJson(data);
      isLoading = false;
      print('_____products______${productsData.products!.length}');
      notifyListeners();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
