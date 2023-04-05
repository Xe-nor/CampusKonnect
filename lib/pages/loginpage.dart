import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      setState(
        () {
          changebutton1 = true;
        },
      );
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }

    setState(
      () {
        changebutton1 = false;
      },
    );
  }

  movetohome2(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(
        () {
          changebutton2 = true;
        },
      );
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
    }

    setState(
      () {
        changebutton2 = false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  fillColor: Color(0xff393948),
                  filled: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.email),
                  hintText: "Enter E-mail ID",
                  labelText: "E-mail ID",
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value == "") {
                  return "Username cant be empty";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  fillColor: Color(0xff393948),
                  filled: true,
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye)),
                  hintText: "Enter Password",
                  labelText: "Password",
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value == "") {
                  return "Password cant be empty";
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {}, child: const Text("Forgot Password?")),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => movetohome(context),
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
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
              child: Text("OR"),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
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
              onPressed: () {},
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
