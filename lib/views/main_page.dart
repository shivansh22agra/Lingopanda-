import 'dart:math';

import 'package:boomer/views/dashBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/movies.dart';

class MainPage extends StatefulWidget {
  static String id = "/MainPage";
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Size size;
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 10), () {
    //   Navigator.push(
    //     context,
    //     PageRouteBuilder(
    //       transitionDuration: const Duration(milliseconds: 800),
    //       reverseTransitionDuration: const Duration(milliseconds: 800),
    //       pageBuilder: (_, __, ___) => FadeTransition(
    //         opacity: __,
    //         child: HomePage(),
    //       ),
    //     ),
    //   );
    // });
    // TODO: implement initState
    super.initState();
  }

  double top = -300;

  double left = 90;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final columns = sqrt(movies.length).toInt();
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: GestureDetector(
          onPanUpdate: (details) {
            var topPos = top + (details.delta.dy * 1.5);
            var leftPos = left + (details.delta.dx * 1.5);
            //set the state
            setState(() {
              top = topPos;
              left = leftPos;
            });
          },
          child: Container(
            color: Colors.black,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.easeOut,
                  top: top,
                  left: left ,
                  child: Opacity(
                    opacity: .5,
                    child: SizedBox(
                      width: size.width * 1.2,
                      child: Wrap(
                        children: [
                          for (int i = 0; i < movies.length; i++)
                            Container(
                              transform: Matrix4.rotationZ(
                                1 / 4,
                              ),
                              margin: EdgeInsets.only(
                                  left: i.isEven ? 10 : 0,
                                  top: i.isEven ? 10 : 0,
                                  bottom: i.isEven ? 10 : 0,
                                  right: i.isEven ? 10 : 0),
                              height: 200,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  // color: Colors.deepPurpleAccent,
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Image.network(
                                    movies[i].image,
                                    width: 100.w,
                                    fit: BoxFit.cover,
                                  )),
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(milliseconds: 800),
                          pageBuilder: (_, __, ___) => FadeTransition(
                            opacity: __,
                            child:  DashBoard(),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Zenion',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
