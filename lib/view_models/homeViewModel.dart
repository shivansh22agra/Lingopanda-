import 'package:boomer/models/movies.dart';
import 'package:flutter/material.dart';
class HomeViewModel extends ChangeNotifier {
  int counter = 0;
  List<bool> islike = List.generate(movies.length, (index) => false).toList();
  // int get counter => _counter;

  void changeisLike(int index) {
    islike[index] = !islike[index];
    notifyListeners();
  }

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}
