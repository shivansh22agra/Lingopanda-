import 'package:boomer/view_models/homeViewModel.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String id = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            homeViewModel.incrementCounter();
          },
          child: Center(child: Text(homeViewModel.counter.toString()))),
    );
  }
}
