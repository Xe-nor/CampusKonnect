//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/pages/profilepage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
    return Scaffold(
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
        backgroundColor: const Color(0xff22222C),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
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
                        onSaved: (String usn) {
                          username = usn;
                        },
                        controller: _usernameTextController,
                        bool: false,
                        hinttxt: 'Enter your Name',
                        icon: Icons.person,
                        labeltxt: 'Name',
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
                      onSaved: (String eml) {
                        email = eml;
                      },
                      controller: _emailTextController,
                      bool: false,
                      labeltxt: "E-mail",
                      hinttxt: "Enter your E-mail",
                      icon: Icons.email,
                      validator: (String input) {
                        if (input.isEmpty) {
                          Get.snackbar('Warning', 'Email is empty');
                          return '';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(input)) {
                          Get.snackbar('Warning', 'Email is in-valid.');
                          return '';
                        }
                        // if (!input.contains('@')) {
                        //   Get.snackbar('Warning', 'Email is in-valid.');
                        //   return '';
                        // }
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textform(
                      onSaved: (String pass) {
                        password = pass;
                      },
                      controller: _passwordTextController,
                      labeltxt: "Password",
                      hinttxt: "Enter your Password",
                      icon: Icons.key,
                      bool: false,
                      validator: (String input) {
                        if (input.isEmpty) {
                          Get.snackbar('Warning', 'Password is empty');
                          return '';
                        }
                        if (input.length < 6) {
                          Get.snackbar('Warning', 'Enter Strong password');
                          return '';
                          //return "Password do not match";
                        }
                      },
                      //onSaved: (value) => password = value,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textform(
                        onSaved: (String conpass) {
                          confirmpassword = conpass;
                        },
                        controller: _confirmPasswordTextController,
                        labeltxt: "Confirm Password",
                        hinttxt: "Re-enter your Password",
                        icon: Icons.key,
                        bool: true,
                        validator: (String input) {
                          if (input != _passwordTextController.text) {
                            Get.snackbar('Warning', 'Password do not match');
                            return '';
                            //return "Password do not match";
                          }
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
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
                                  password: _passwordTextController.text.trim())
                              .then((value) {
                            print("Created new account");

                            Get.to(() => const Profile(),
                                transition: Transition.cupertinoDialog,
                                duration: const Duration(milliseconds: 1500));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5669FF)),
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                      child: Text("OR"),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          //Here
                        },
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
                        Get.to(() => const Loginpage(),
                            transition: Transition.cupertinoDialog,
                            duration: const Duration(milliseconds: 1500));
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: TextStyle(color: Colors.white60),
                          children: [
                            TextSpan(
                                text: "Log in!",
                                style: TextStyle(color: Colors.blueAccent)),
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

