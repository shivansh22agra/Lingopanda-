import 'package:boomer/firebase_options.dart';
import 'package:boomer/view_models/homeViewModel.dart';
import 'package:boomer/views/dashBoardViews/home_page.dart';
import 'package:boomer/views/main_page.dart';
import 'package:boomer/views/sign_Up.dart';
import 'package:boomer/views/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
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
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Boomer',
            darkTheme: ThemeData.dark(),
            initialRoute: MainPage.id,
            routes: {
              SignIn.id: (context) => SignIn(),
              MainPage.id: (context) => const MainPage(),
              SignUp.id: (context) => SignUp(),
              HomePage.id: (context) => const HomePage()
            },
          ),
        );
      },
    );
  }
}
