import 'package:campuskonnect/pages/forgotPassword.dart';
import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/create_event.dart';
import 'package:campuskonnect/pages/eventdetail2.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final sharedPreferences = snapshot.data!;
            final logoutFlag = sharedPreferences.getBool('logoutFlag') ?? false;

            return GetMaterialApp(
              title: "campuskonnect",
              themeMode: themeProvider.themeMode,
              darkTheme: MyTheme.dark,
              home: StreamBuilder<User?>(
                stream: _auth.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
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
              onGenerateRoute: (settings) {
                if (logoutFlag && settings.name != MyRoutes.loginRoute) {
                  return MaterialPageRoute(
                    builder: (context) => const Loginpage(),
                  );
                }
                return null;
              },
            );
          },
        );
      },
    );
  }
}
