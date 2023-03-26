import 'package:flutter/material.dart';

import '../models/movies.dart';

class SearchViewModel extends ChangeNotifier {
  List showMovies = movies;
  String searchQuery = "";
  void searchMovies(String value) {
    searchQuery = value;
    showMovies = movies
        .where((element) =>
            element.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
