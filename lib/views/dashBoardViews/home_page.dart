import 'package:boomer/models/movies.dart';
import 'package:boomer/view_models/homeViewModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static String id = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
        backgroundColor: Colors.black,
        body: GestureDetector(
          onTap: () {
            homeViewModel.incrementCounter();
          },
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              CarouselSlider(
                  items: [
                    for (int i = 0; i < movies.length; i++)
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 3.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.network(movies[i].image,
                                fit: BoxFit.cover, width: 1000.w)),
                      )
                  ],
                  options: CarouselOptions(
                      viewportFraction: .8,
                      enlargeCenterPage: true,
                      enlargeFactor: .2)),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Continue viewing',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                          color: Colors.white),
                    ),
                    Text(
                      'show all',
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
