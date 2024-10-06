import 'package:boomer/views/dashBoardViews/home_page.dart';
import 'package:boomer/views/sign_Up.dart';
import 'package:boomer/views/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/movies.dart';

class MainPage extends StatefulWidget {
  static String id = "/MainPage";
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Size size;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (_, __, ___) => FadeTransition(
            opacity: __,
            child: FirebaseAuth.instance.currentUser != null
                ? const HomePage()
                : SignUp(),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Container(
          color: const Color(0xFF0C54BE),
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Lingopanda',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
