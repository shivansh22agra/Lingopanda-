import 'package:boomer/views/dashBoard.dart';
import 'package:boomer/views/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatelessWidget {
  static String id = "/signIn";
  SignIn({super.key});
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 110.h),
                      Text(
                        'Login to continue',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp),
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Color(0xFFF0F0F0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Spacer(),
                            Text(
                              "+91",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  height: 1.2.h,
                                  color:
                                      const Color.fromRGBO(102, 102, 102, 1)),
                            ),
                            SizedBox(
                              width: 25.w,
                            ),
                            Text(
                              "|",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color:
                                      const Color.fromRGBO(102, 102, 102, 1)),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Container(
                              //   color: Colors.black,
                              //    height: 40.h,
                              width: size.width * 0.6,
                              child: TextField(
                                controller: phoneController,
                                key: const Key('phone'),
                                cursorColor: Colors.grey,
                                textAlignVertical: TextAlignVertical.center,
                                maxLength: 10,
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(102, 102, 102, 1)),
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  // contentPadding:  EdgeInsets.only(
                                  //   bottom: 3.h
                                  // ),
                                  counterText: '',
                                  border: InputBorder.none,
                                  prefixStyle:
                                      GoogleFonts.poppins(fontSize: 16.sp),
                                  hintStyle: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFFADADAD)),
                                  hintText: '9862436514',
                                ),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        'You will recieve an OTP for verification',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 11.sp,
                            color: const Color(0xFFADADAD)),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushNamed(context, OtpScreen.id);
                            // final prefs =
                            //     await SharedPreferences.getInstance();
                            // prefs.setBool('loginotp', true);

                            // FocusManager.instance.primaryFocus?.unfocus();
                            // await FirebaseAuth.instance.verifyPhoneNumber(
                            //   phoneNumber: "+91${phoneController.text}",
                            //   verificationCompleted:
                            //       (PhoneAuthCredential credential) {},
                            //   verificationFailed:
                            //       (FirebaseAuthException e) {},
                            //   codeSent: (String verificationId,
                            //       int? resendToken) async {
                            //     await FirebaseAnalytics.instance
                            //         .setCurrentScreen(
                            //             screenName: 'OTPScreen');
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => OTPWidgets(
                            //           phoneNumber: phoneController.text,
                            //           resendToken: resendToken,
                            //           verificationId: verificationId,
                            //         ),
                            //       ),
                            //     );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Text('Get OTP',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: double.infinity - 40,
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: () async {
                            signInWithGoogle().then((value) {
                              print('User value $value');
                              Navigator.pushNamed(context, DashBoard.id);
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,

                            backgroundColor: const Color(0xFFFFFFFF),
                            //const Color(0xFF00E283),
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Color(0xFFCCCCCC)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(' Google ',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xFF2C2C2C),
                                      fontSize: 14.sp,
                                      // height: 1.5.h,
                                      fontWeight: FontWeight.w600,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
