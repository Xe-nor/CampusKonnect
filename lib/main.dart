import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/profilepage.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/pages/splashscreen.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "CampusKonnect",
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        canvasColor: const Color(0xff22222C),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          color: Color(0xff2D2D3A),
        ),
      ),
      initialRoute: MyRoutes.splashscreen,
      routes: {
        "/": (context) => const Loginpage(),
        MyRoutes.splashscreen: (context) => Splashscreen(),
        MyRoutes.homeRoute: (context) => const Homepage(),
        MyRoutes.loginRoute: (context) => const Loginpage(),
        MyRoutes.signupscreen: (context) => const Signupscreen(),
        MyRoutes.profilepage: (context) => const Profile(),
      },
    );
  }
}
