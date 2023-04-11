import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
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
              Get.to( const Homepage(),
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
                    const textform(
                      obscure: false,
                      hinttxt: 'Enter your Name',
                      icon: Icons.person,
                      labeltxt: 'Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const textform(
                        obscure: false,
                        labeltxt: "E-mail",
                        hinttxt: "Enter your E-mail",
                        icon: Icons.email),
                    const SizedBox(
                      height: 20,
                    ),
                    const textform(
                        labeltxt: "Password",
                        hinttxt: "Enter your Password",
                        icon: Icons.key,
                        obscure: true),
                    const SizedBox(
                      height: 20,
                    ),
                    const textform(
                        labeltxt: "Confirm Password",
                        hinttxt: "Re-enter your Password",
                        icon: Icons.key,
                        obscure: true),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {},
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
                        onPressed: () {},
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
                        Get.to(const Loginpage(),
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

