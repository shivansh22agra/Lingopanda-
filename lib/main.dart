import 'package:boomer/firebase_options.dart';
import 'package:boomer/services/firebase_analytics.dart';
import 'package:boomer/view_models/dashBoardViewModel.dart';
import 'package:boomer/view_models/homeViewModel.dart';
import 'package:boomer/view_models/searchViewModel.dart';
import 'package:boomer/views/dashBoard.dart';
import 'package:boomer/views/dashBoardViews/home_page.dart';
import 'package:boomer/views/main_page.dart';
import 'package:boomer/views/otp_screen.dart';
import 'package:boomer/views/sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => HomeViewModel()),
            ChangeNotifierProvider(create: (context) => SearchViewModel()),
            ChangeNotifierProvider(create: (context) => DashBoardViewModel())
          ],
          child: MaterialApp(
            // navigatorKey: Get.key,
            navigatorObservers: [
              AnalyticsService().getAnalyticsOberserver(),
            ],
            debugShowCheckedModeBanner: false,
            title: 'Boomer',
            darkTheme: ThemeData.dark(),
            initialRoute: MainPage.id,
            routes: {
              DashBoard.id: (context) => DashBoard(),
              SignIn.id: (context) => SignIn(),
              OtpScreen.id: (context) => OtpScreen(),
              MainPage.id: (context) => MainPage(),
              HomePage.id: (context) => HomePage()
            },
          ),
        );
      },
    );
  }
}
