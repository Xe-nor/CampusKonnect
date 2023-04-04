import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

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
        child: Form(
          key: formkey,
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter E-mail ID",
                        labelText: "E-mail ID",
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Username cant be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Password cant be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () => movetohome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changebutton1 ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff5669FF),
                          borderRadius:
                              BorderRadius.circular(changebutton1 ? 100 : 0),
                        ),
                        child: changebutton1
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Sign in",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => movetohome2(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changebutton2 ? 50 : 250,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xff5669FF),
                          borderRadius:
                              BorderRadius.circular(changebutton2 ? 100 : 0),
                        ),
                        child: changebutton2
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                "Sign in with Google",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
