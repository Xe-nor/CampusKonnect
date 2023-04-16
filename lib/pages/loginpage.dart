// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:campuskonnect/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/signup.dart';
import 'package:campuskonnect/utils/routes.dart';
import 'package:campuskonnect/widgets/textform.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool changebutton1 = false;
  bool changebutton2 = false;
  final formkey = GlobalKey<FormState>();

  movetohome(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  movetohome2(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, top: 100, right: 20, bottom: 30),
              child: Image.asset(
                "assets/images/nobglogo2.png",
                fit: BoxFit.contain,
                height: size.height * 0.12,
                color: Appcolors.darkprimary,
              ),
            ),
            loginform(context)
          ],
        ),
      ),
    );
  }

  Form loginform(BuildContext context) {
    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textform(
              bool: false,
              hinttxt: "Enter your Email",
              labeltxt: "Email",
              icon: Icons.email,
            ),
            const SizedBox(
              height: 20,
            ),
            textform(
                labeltxt: "Password",
                hinttxt: "Enter your Password",
                icon: Icons.key,
                bool: true),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("Forgot Password?")),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () => movetohome(context),
                // onPressed: () {
                //   FirebaseAuth.instance
                //       .signInWithEmailAndPassword(
                //           email: _emailTextController.text, password: password)
                //       .then((value) {
                //     movetohome(context);
                //   });
                // },

                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5669FF)),
                child: Text(
                  "Log in",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Text("OR"),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton.icon(
                onPressed: () => movetohome(context),
                icon: const Icon(
                  FontAwesomeIcons.google,
                  size: 17,
                ),
                label: const Text(
                  "Sign in with Google",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(const Signupscreen(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 1500));
              },
              child: const Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(color: Colors.white60),
                  children: [
                    TextSpan(
                        text: "Sign Up!",
                        style: TextStyle(color: Colors.blueAccent)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
