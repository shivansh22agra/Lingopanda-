import 'package:boomer/models/movies.dart';
import 'package:boomer/view_models/homeViewModel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static String id = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final homeViewModel = context.read<HomeViewModel>();
    homeViewModel.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF0C54BE),
          title: Text(
            'e-Shop',
            style: GoogleFonts.poppins(
              color: const Color(0xFFF5F9FD),
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: homeViewModel.isLoading
            ? const CircularProgressIndicator(
                color: Color(0xFF0C54BE),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final product = homeViewModel.products[index];
                  return Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.network(
                            'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png'),
                        15.verticalSpace,
                        Text(
                          'iPhone 9',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        Text(
                          'An apple mobile which is nothing like apple ...',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  );
                }));
  }
}
