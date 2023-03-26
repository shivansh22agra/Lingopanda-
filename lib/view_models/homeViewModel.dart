import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier{
  int counter = 0;
  // int get counter => _counter;

  void incrementCounter(){
    counter++;
    notifyListeners();
  }
}