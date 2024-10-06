import 'package:boomer/services/firebase_login.dart';
import 'package:boomer/views/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatelessWidget {
  static String id = "/signUp";
  SignUp({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'e-Shop',
          style: GoogleFonts.poppins(
            color: const Color(0xFF0C54BE),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Name',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            10.verticalSpace,
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Email',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            10.verticalSpace,
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.white,
                filled: true,
                hintText: 'Password',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // SizedBox(
            //   width: double.infinity - 40,
            //   height: 40.h,
            //   child: ElevatedButton(
            //     onPressed: () async {
            //       signInWithGoogle().then((value) {
            //         print('User value $value');
            //         Navigator.pushNamed(context, HomePage.id);
            //       });
            //     },
            //     style: ElevatedButton.styleFrom(
            //       elevation: 0,

            //       backgroundColor: const Color(0xFFFFFFFF),
            //       //const Color(0xFF00E283),
            //       shape: RoundedRectangleBorder(
            //         side: const BorderSide(color: Color(0xFFCCCCCC)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //     child: Center(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Text(' Google ',
            //               style: GoogleFonts.poppins(
            //                 color: const Color(0xFF2C2C2C),
            //                 fontSize: 14.sp,
            //                 // height: 1.5.h,
            //                 fontWeight: FontWeight.w600,
            //               )),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            const Spacer(),
            SizedBox(
              width: .5.sw,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0C54BE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all the fields'),
                        ),
                      );
                      return;
                    }
                    AuthService().signUp(
                        emailController.text, passwordController.text, context);
                  },
                  child: Text(
                    'Signup',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  )),
            ),
            15.verticalSpace,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Already have an account?',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: ' ',
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignIn()),
                        );
                      },
                    text: 'Login',
                    style: GoogleFonts.poppins(
                      color: const Color(0xFF0C54BE),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            20.verticalSpace
          ],
        ),
      ),
    );
  }
}
