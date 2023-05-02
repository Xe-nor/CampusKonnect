import 'package:campuskonnect/pages/forgotPassword.dart';
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoggedIn = false;

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
          home: StreamBuilder<User?>(
            stream: _auth.authStateChanges(),
            builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return Splashscreen();
              // }
              if (snapshot.hasData) {
                print(snapshot.data);
                return const Homepage();
              }
              return const Loginpage();
            },
          ),
          routes: {
            MyRoutes.splashscreen: (context) => Splashscreen(),
            MyRoutes.homeRoute: (context) => const Homepage(),
            MyRoutes.loginRoute: (context) => const Loginpage(),
            MyRoutes.signupscreen: (context) => const Signupscreen(),
            MyRoutes.profilepage: (context) => const profile(),
            MyRoutes.eventdetail: (context) => const eventdetail(),
            MyRoutes.createevent: (context) => const CreateEvent(),
            MyRoutes.forgotpassword: (context) => const ForgotPassword(),
          },
        );
      },
    );
  }
}
