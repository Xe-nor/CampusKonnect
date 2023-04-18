// import 'package:campuskonnect/utils/colors.dart';
import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/create_event.dart';
import 'package:campuskonnect/pages/eventdetail.dart';
import 'package:campuskonnect/pages/bottomnavbar.dart';
import 'package:campuskonnect/pages/loginpage.dart';
import 'package:campuskonnect/pages/profilepage.dart';
import 'package:campuskonnect/pages/signup.dart';
import 'package:campuskonnect/pages/splashscreen.dart';
import 'package:campuskonnect/utils/routes.dart';
import 'package:get/get.dart';
// import 'package:image_form_field/image_form_field.dart';

// import 'package:campuskonnect/pages/img_input.dart';
// import 'dart:io';

// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return GetMaterialApp(
          title: "campuskonnect",
          themeMode: themeProvider.themeMode,
          darkTheme: MyTheme.dark,
          initialRoute: MyRoutes.createevent,
          routes: {
            // "/": (context) => const Homepage(),
            MyRoutes.splashscreen: (context) => Splashscreen(),
            MyRoutes.homeRoute: (context) => const Homepage(),
            MyRoutes.loginRoute: (context) => const Loginpage(),
            MyRoutes.signupscreen: (context) => const Signupscreen(),
            MyRoutes.profilepage: (context) => const profile(),
            MyRoutes.eventdetail: (context) => const eventdetail(),
            MyRoutes.createevent: (context) => const CreateEvent(),
            // MyRoutes.image_input: (context) => const GetImage(),
          },
        );
      },
    );
  }
}
