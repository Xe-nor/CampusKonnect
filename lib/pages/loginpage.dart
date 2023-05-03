import 'package:campuskonnect/pages/bottomnavbar.dart';
import 'package:campuskonnect/pages/dashboard2.dart';
import 'package:campuskonnect/pages/eventdetail.dart';
import 'package:campuskonnect/pages/forgotPassword.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController countrycode = TextEditingController();
  var phone = "";
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
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

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
                      left: 20, top: 65, right: 20, bottom: 30),
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
                type: TextInputType.emailAddress,
                isObscure: false,
                suffixIcon: null,
                isPrefixIcon: true,
                onSaved: (String value) {}),
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
                isObscure: true,
                suffixIcon: null,
                isPrefixIcon: true,
                onSaved: (String value) {}), // textform

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  bottomsheet(context);
                },
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
                       
                    Get.to(() => const Homepage(),
                        transition: Transition.cupertinoDialog,
                        duration: const Duration(milliseconds: 1500));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");

                    Get.snackbar('Warning', 'Email or Password is in-valid.');
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolors.buttoncolor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Appcolors.buttoncolor),
                  ),
                ),
                child: Text(
                  "Sign in",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Appcolors.lightprimary),
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
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Appcolors.darkprimary,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(color: Appcolors.buttoncolor),
                  ),
                ),
                // style: OutlinedButton.styleFrom(
                //     shape: const StadiumBorder(
                //         side: BorderSide(color: Appcolors.buttoncolor))),
                onPressed: () async {
                  //here sign in with google
                  await FirebaseServices().signInwithGoogle();
                  Get.to(() => const Homepage(),arguments: {'username': _emailTextController.text},
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
                Get.to(() => const Signupscreen(), 
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 1500));
              },
              child: Text.rich(
                TextSpan(
                  text: "Don't have an account? ",
                  style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      color: Appcolors.lightprimary),
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

  Future<dynamic> bottomsheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "FORGOT \nPASSWORD?",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w600, fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter your Registered Email Id to recieve the verification code.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.urbanist(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textform(
                      type: TextInputType.phone,
                      controller: _phonenumber,
                      isPrefixIcon: true,
                      isObscure: false,
                      prefixIcon: FontAwesomeIcons.phone,
                      hinttxt: "Enter your Phone number",
                      labeltxt: "Phone Number",
                      onChanged: (value) {
                        phone = value;
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+91 8249702599",
                          verificationCompleted:
                              (PhoneAuthCredential credential) {},
                          verificationFailed: (FirebaseAuthException e) {},
                          codeSent:
                              (String verificationId, int? resendToken) {},
                          codeAutoRetrievalTimeout: (String verificationId) {},
                        );

                        // Get.to(const ForgotPassword());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.buttoncolor,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              side: BorderSide(color: Appcolors.buttoncolor))),
                      child: Text(
                        "Send OTP",
                        style: GoogleFonts.urbanist(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Appcolors.lightprimary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
