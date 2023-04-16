import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/textform.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/pages/profilepage.dart';

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
                //const textform(
                controller: _emailTextController,
                labeltxt: "E-mail",
                hinttxt: "Enter your E-mail",
                icon: Icons.email,
                bool: false,
                validator: (String input) {
                  if (input.isEmpty) {
                    Get.snackbar('Warning', 'Email is empty');
                    return '';
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            textform(
                //const textform(
                controller: _passwordTextController,
                labeltxt: "Password",
                hinttxt: "Enter your Password",
                icon: Icons.key,
                bool: true,
                validator: (String input) {
                  if (input.isEmpty) {
                    Get.snackbar('Warning', 'Password is empty');
                    return '';
                  }
                }),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("Forgot Password?")),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                //onPressed: () => movetohome(context),
                onPressed: () {
                  //_logIn();
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
                    Get.to(() => const Profile(),
                        transition: Transition.cupertinoDialog,
                        duration: const Duration(milliseconds: 1500));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");

                    Get.snackbar('Warning', 'Email or Password is in-valid.');
                  });
                },

                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5669FF)),
                child: const Text(
                  "Log in",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
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
                Get.to(() => Signupscreen(), //const Signupscreen(),
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
