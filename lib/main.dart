import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/create_event.dart';

import 'package:flutter_application_1/pages/homepage.dart';
// import 'package:flutter_application_1/pages/informationpage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
// import 'package:flutter_application_1/pages/mainpage.dart';
import 'package:flutter_application_1/pages/profilepage.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/pages/splashscreen.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/pages/create_event.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
//import 'package:google_fonts/google_fonts.dart';
//import 'package:firebase_auth/firebase_auth.dart';
=======
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
>>>>>>> 63186731752331c46212bfc52e097af37efd3ae3
import 'package:firebase_core/firebase_core.dart';

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

      initialRoute: MyRoutes.create_event,

      routes: {
        "/": (context) => const Homepage(),
        MyRoutes.splashscreen: (context) => Splashscreen(),
        MyRoutes.homeRoute: (context) => const Homepage(),
        MyRoutes.loginRoute: (context) => const Loginpage(),
<<<<<<< HEAD
        MyRoutes.signupscreen: (context) =>
            const Signupscreen(), //const Signupscreen()
        MyRoutes.profilepage: (context) => const Profile(),
=======
        MyRoutes.signupscreen: (context) => const Signupscreen(),
        MyRoutes.profilepage: (context) => const profile(),

        MyRoutes.eventdetail: (context) => const eventdetail(),
        // MyRoutes.infopage: (context) => const info(),

        // MyRoutes.mainpage: (context) => const mainpage(),
>>>>>>> 63186731752331c46212bfc52e097af37efd3ae3
      },
    );
  }
}
