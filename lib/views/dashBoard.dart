import 'package:boomer/views/dashBoardViews/home_page.dart';
import 'package:boomer/views/dashBoardViews/like_page.dart';
import 'package:boomer/views/dashBoardViews/profile_page.dart';
import 'package:boomer/views/dashBoardViews/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:boomer/view_models/dashBoardViewModel.dart';

class DashBoard extends StatelessWidget {
  static String id = "/dashboard";
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardViewModel dashBoardViewModel = context.watch<DashBoardViewModel>();
    return Scaffold(
      body: PageView(
        onPageChanged: (index){
          dashBoardViewModel.toggleTab(index);
        },
        controller: dashBoardViewModel.pageController,
        children: [HomePage(), Searchpage(), LikePage(), ProfilePage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.poppins(),
        unselectedFontSize: 12,
        selectedFontSize: 12,
        iconSize: 28.sp,
        items: const [
          // BottomNavigationBarItem(
          //     activeIcon: Icon(Icons.school),
          //     icon: Icon(Icons.school_outlined),
          //     label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              activeIcon: Icon(Icons.explore),
              label: "Explore"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.school),
              icon: Icon(Icons.school_outlined),
              label: "Courses"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              activeIcon: Icon(Icons.calculate_rounded),
              label: "Tools"),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.account_circle_rounded),
              icon: Icon(Icons.account_circle_outlined),
              label: "Profile"),
        ],
        currentIndex: dashBoardViewModel.selectedIndex,
        onTap: (int index) {
          dashBoardViewModel.toggleTab(index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: const Color(0xFFADADAD),
        selectedItemColor: const Color(0xFF2C2C2C),
      ),
    );
  }
}
