import 'package:boomer/models/movies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../view_models/searchViewModel.dart';

class Searchpage extends StatelessWidget {
  static String id = "/searchPage";
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    SearchViewModel searchViewModel = context.watch<SearchViewModel>();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: CupertinoSearchTextField(
                  style: GoogleFonts.poppins(color: Colors.white),
                  onChanged: (value) {
                    searchViewModel.searchMovies(value);
                  },
                )),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: searchViewModel.showMovies.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  // height: 220.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.network(
                            searchViewModel.showMovies[index].image,
                            fit: BoxFit.cover,
                            width: 200.w,
                            height: 200.h,
                          )),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: size.width * .3,
                            child: Text(searchViewModel.showMovies[index].name,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                    color: Colors.white)),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
