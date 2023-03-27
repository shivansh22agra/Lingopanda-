import 'package:boomer/views/dashBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreen extends StatelessWidget {
  
  static String id = "/otpScreen";
  OtpScreen({super.key});
  String otpCode = '';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 110.h),
                      Text(
                        'Otp Screen',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp),
                      ),
                      SizedBox(height: 30.h),
                      Center(
                        child: PinFieldAutoFill(
                          decoration: BoxLooseDecoration(
                            bgColorBuilder:
                                const FixedColorBuilder(Color(0xFFF0F0F0)),
                            textStyle: GoogleFonts.poppins(
                                fontSize: 20.sp,
                                color: const Color(0xFF2C2C2C)),
                            strokeColorBuilder:
                                const FixedColorBuilder(Colors.transparent),
                          ),
                          currentCode: otpCode,
                          cursor: Cursor(
                              color: Color(0xFF00E283),
                              enabled: true,
                              width: 1),
                          onCodeSubmitted: (code) {},
                          onCodeChanged: (code) async {
                            if (code!.length == 6) {
                              // otp = code;
                              // print('otp  $otp');
                              // final prefs =
                              //     await SharedPreferences.getInstance();
                              // prefs.setBool('loginotp', true);
                              // onConfirm(otp, true);
                              // // FocusScope.of(context).requestFocus(FocusNode());
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: 40.h,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.pushNamed(context, DashBoard.id);
                          
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            // padding:
                            //     const EdgeInsets.symmetric(horizontal: 25)
                          ),
                          child: Text('Verify',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              )),
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
