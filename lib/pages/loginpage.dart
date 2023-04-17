import 'package:campuskonnect/pages/eventdetail.dart';
import 'package:campuskonnect/pages/profilepage.dart';
import 'package:campuskonnect/services/firebase_services.dart';
import 'package:campuskonnect/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/signup.dart';
import 'package:campuskonnect/utils/routes.dart';
import 'package:campuskonnect/widgets/textform.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../widgets/textform.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
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

  // void _logIn() async {
  //   final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
  //           email: _emailTextController.text,
  //           password: _passwordTextController.text))
  //       .user;

  //   if (user != null) {
  //     Get.to(() => const Profile(),
  //         transition: Transition.cupertinoDialog,
  //         duration: const Duration(milliseconds: 1500));
  //   } else {
  //     Get.snackbar('Warning', 'Email or Password is in-valid.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
      child: Material(
        child: SingleChildScrollView(
          child: KeyboardDismisser(
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
                  ),
                ),
                loginform(context)
              ],
            ),
          ),
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
              //const textform(
              controller: _emailTextController,

              validator: (String input) {
                if (input.isEmpty) {
                  Get.snackbar('Warning', 'Email is empty');
                  return '';
                }
              },
              hinttxt: "email@example.com",
              labeltxt: "Email",
              prefixIcon: FontAwesomeIcons.envelope,
              isEmail: true,
              isObscure: false,
              suffixIcon: null,
              isPrefixIcon: true,
            ),
            const SizedBox(
              height: 20,
            ),

            textform(
              controller: _passwordTextController,
              validator: (String input) {
                if (input.isEmpty) {
                  Get.snackbar('Warning', 'Password is empty');
                  return '';
                }
              },
              labeltxt: "Password",
              hinttxt: "Enter your Password",
              prefixIcon: FontAwesomeIcons.lock,
              isEmail: false,
              isObscure: true,
              suffixIcon: null,
              isPrefixIcon: true,
            ), // textform

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.urbanist(
                      color: Appcolors.buttoncolor,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState != null) {
                    if (!formkey.currentState!.validate()) {
                      return;
                    }
                  }
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    Get.to(() => const eventdetail(),
                        transition: Transition.cupertinoDialog,
                        duration: const Duration(milliseconds: 1500));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");

                    Get.snackbar('Warning', 'Email or Password is in-valid.');
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.buttoncolor,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Appcolors.buttoncolor))),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                      color: Appcolors.lightprimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Text(
                "OR",
                style: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(
                        side: BorderSide(color: Appcolors.buttoncolor))),
                onPressed: () async {
                  //here sign in with google
                  await FirebaseServices().signInwithGoogle();
                  Get.to(() => const profile(),
                      transition: Transition.cupertinoDialog,
                      duration: const Duration(milliseconds: 1500));
                },
                icon: const Icon(
                  color: Appcolors.iconcolor,
                  FontAwesomeIcons.google,
                  size: 17,
                ),
                label: Text(
                  "Sign in with Google",
                  style: GoogleFonts.urbanist(
                      fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const Signupscreen(), //const Signupscreen(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 1500));
              },
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: "Sign Up!",
                      style: GoogleFonts.urbanist(
                          color: Appcolors.buttoncolor,
                          fontWeight: FontWeight.w600),
                    ),
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
