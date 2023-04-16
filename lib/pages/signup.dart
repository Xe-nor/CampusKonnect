import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/bottomnavbar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';
import '../widgets/textform.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final themestar = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.to(const Homepage(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1500));
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.15,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 25),
              child: Column(
                children: const [
                  Text(
                    "Get on board!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Let's get you set up.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 117, 117, 133),
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
            Form(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  children: [
                    textform(
                      hinttxt: 'Enter your Name',
                      prefixIcon: Icons.person,
                      labeltxt: 'Name',
                      isEmail: false,
                      isObscure: false,
                      suffixIcon: null,
                      isPrefixIcon: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textform(
                        isPrefixIcon: true,
                        isObscure: false,
                        labeltxt: "E-mail",
                        hinttxt: "Enter your E-mail",
                        prefixIcon: Icons.email,
                        isEmail: true,
                        suffixIcon: null),
                    const SizedBox(
                      height: 20,
                    ),
                    textform(
                        isPrefixIcon: true,
                        labeltxt: "Password",
                        isObscure: false,
                        hinttxt: "Enter your Password",
                        prefixIcon: Icons.key,
                        isEmail: false,
                        suffixIcon: null),
                    const SizedBox(
                      height: 20,
                    ),
                    textform(
                        isPrefixIcon: true,
                        labeltxt: "Confirm Password",
                        isObscure: false,
                        hinttxt: "Re-enter your Password",
                        prefixIcon: Icons.key,
                        isEmail: true,
                        suffixIcon: null),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.buttoncolor,
                            shape: const StadiumBorder(
                                side:
                                    BorderSide(color: Appcolors.buttoncolor))),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 0),
                      child: Text(
                        "OR",
                        style: GoogleFonts.urbanist(
                            color: Appcolors.lightprimary,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.darkprimary,
                            shape: const StadiumBorder(
                                side:
                                    BorderSide(color: Appcolors.buttoncolor))),
                        onPressed: () => {},
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
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types

