import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/signup.dart';
import 'package:campuskonnect/utils/routes.dart';
import 'package:campuskonnect/widgets/textform.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

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
              labeltxt: "Password",
              hinttxt: "Enter your Password",
              prefixIcon: FontAwesomeIcons.lock,
              isEmail: false,
              isObscure: true,
              suffixIcon: null,
              isPrefixIcon: true,
            ),
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
                onPressed: () => movetohome(context),
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
                style: GoogleFonts.urbanist(
                    color: Appcolors.lightprimary, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.darkprimary,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Appcolors.buttoncolor))),
                onPressed: () => movetohome(context),
                icon: const Icon(
                  color: Appcolors.iconcolor,
                  FontAwesomeIcons.google,
                  size: 17,
                ),
                label: Text(
                  "Sign in with Google",
                  style: GoogleFonts.urbanist(
                      color: Appcolors.lightprimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(const Signupscreen(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 1500));
              },
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.urbanist(
                      color: Appcolors.lightprimary,
                      fontWeight: FontWeight.w600),
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
