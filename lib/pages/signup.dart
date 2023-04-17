//import 'dart:html';
import 'package:campuskonnect/pages/dashboard.dart';
import 'package:campuskonnect/services/firebase_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/loginpage.dart';
import 'package:campuskonnect/pages/profilepage.dart';
import 'package:campuskonnect/pages/bottomnavbar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../utils/theme.dart';
import '../widgets/textform.dart';

class Signupscreen extends StatefulWidget {
  // need to make it stateless //ignore
  //const Signupscreen({super.key});
  const Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  //Signupscreen({super.key}); //const Signupscreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();

  String? email, password, username, confirmpassword;

  @override
  Widget build(BuildContext context) {
    // final themestar = Theme.of(context);
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.to(() => const Homepage(),
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
                // height: MediaQuery.of(context).size.height * 0.1,
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
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
                key: formKey,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    children: [
                      textform(
                          controller: _usernameTextController,
                          hinttxt: 'Enter your Name',
                          prefixIcon: Icons.person,
                          labeltxt: 'Name',
                          isEmail: false,
                          isObscure: false,
                          suffixIcon: null,
                          isPrefixIcon: true,
                          validator: (String input) {
                            if (input.isEmpty) {
                              Get.snackbar('Warning', 'Username is empty');
                              return '';
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      textform(
                          controller: _emailTextController,
                          validator: (String input) {
                            if (input.isEmpty) {
                              Get.snackbar('Warning', 'Email is empty');
                              return '';
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(input)) {
                              Get.snackbar('Warning', 'Email is in-valid.');
                              return '';
                            }
                          },
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
                      // textform(
                      //     controller: _emailTextController,
                      //     validator: (String input) {
                      //       if (input.isEmpty) {
                      //         Get.snackbar('Warning', 'Email is empty');
                      //         return '';
                      //       }
                      //       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                      //           .hasMatch(input)) {
                      //         Get.snackbar('Warning', 'Email is in-valid.');
                      //         return '';
                      //       }
                      //       // if (!input.contains('@')) {
                      //       //   Get.snackbar('Warning', 'Email is in-valid.');
                      //       //   return '';
                      //       // }
                      //     },
                      //     isPrefixIcon: true,
                      //     labeltxt: "Password",
                      //     isObscure: false,
                      //     hinttxt: "Enter your Password",
                      //     prefixIcon: Icons.key,
                      //     isEmail: false,
                      //     suffixIcon: null
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      textform(
                          controller: _passwordTextController,
                          labeltxt: "Password",
                          hinttxt: "Enter your Password",
                          validator: (String input) {
                            if (input.isEmpty) {
                              Get.snackbar('Warning', 'Password is empty');
                              return '';
                            }
                            if (input.length < 6) {
                              Get.snackbar('Warning', 'Enter Strong password');
                              return '';
                            }
                          },
                          isPrefixIcon: true,
                          isObscure: false,
                          prefixIcon: Icons.key,
                          isEmail: true,
                          suffixIcon: null),
                      const SizedBox(
                        height: 20,
                      ),
                      textform(
                          controller: _confirmPasswordTextController,
                          isPrefixIcon: true,
                          labeltxt: "Confirm Password",
                          isObscure: false,
                          hinttxt: "Re-enter your Password",
                          validator: (String input) {
                            if (input != _passwordTextController.text) {
                              Get.snackbar('Warning', 'Password do not match');
                              return '';
                              //return "Password do not match";
                            }
                          },
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
                          onPressed: () {
                            // here

                            if (formKey.currentState != null) {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                            }

                            FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: _emailTextController.text.trim(),
                                    password:
                                        _passwordTextController.text.trim())
                                .then((value) {
                              print("Created new account");

                              Get.to(() => const profile(),
                                  transition: Transition.cupertinoDialog,
                                  duration: const Duration(milliseconds: 1500));
                            }).onError((error, stackTrace) {
                              print("Error ${error.toString()}");
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Appcolors.buttoncolor,
                              shape: const StadiumBorder(
                                  side: BorderSide(
                                      color: Appcolors.buttoncolor))),
                          child: const Text(
                            "Sign up",
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
                                  side: BorderSide(
                                      color: Appcolors.buttoncolor))),
                          onPressed: () async {
                            //here sign in with google
                            await FirebaseServices().signInwithGoogle();
                            Get.to(() => const dashboard(),
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
                                color: Appcolors.lightprimary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(const Loginpage(),
                              transition: Transition.cupertino,
                              duration: const Duration(milliseconds: 1500));
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: GoogleFonts.urbanist(
                                color: Appcolors.lightprimary,
                                fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(
                                text: "Sign In!",
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
      ),
    );
  }
}

// ignore: camel_case_types

