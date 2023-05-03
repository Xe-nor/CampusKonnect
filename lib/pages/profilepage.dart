// ignore_for_file: unused_import, camel_case_types

import 'package:campuskonnect/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/loginpage.dart';
import 'package:campuskonnect/services/firebase_services.dart';
import 'package:get/get.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int currentIndex = 2;
    return SafeArea(
      child: Scaffold(
        //!!DO NOT UNCOMMENT (TOGGLE FOR THEMEMODE)
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {},
        //     icon: const Icon(FontAwesomeIcons.arrowLeft),
        //     color: Appcolors.iconcontrast,
        //   ),
        //   elevation: 0,
        //   actions: const [ThemeButton()],
        // ),
        body: Container(
          padding:
              const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //!-----Profile pic
                SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    backgroundImage:
                        const AssetImage("assets/images/defaultpic.jpg"),
                    child: Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Appcolors.buttoncolor, width: 2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //!-----Name
                Text(
                  "Nameabc",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                //!-----Email
                Text(
                  "email@abc",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                  color: Appcolors.buttoncolor,
                ),
                const SizedBox(
                  height: 10,
                ),
                //!-----MENU
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.darkprimary,
                      elevation: 0,
                      shape: const StadiumBorder(
                        side: BorderSide(color: Appcolors.buttoncolor),
                      ),
                    ),
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        applicationName: "campuskonnect",
                        applicationVersion: "1.0.0",
                        applicationIcon: Image.asset("assets/images/logo.png"),
                        children: [
                          Text(
                            "Developers",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Amarendra Dash(2006258)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "Mayur Raj Sarma(2006273)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "Dhriti Das(2006069)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            "Rohit Raj(2006280)",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      );
                    },
                    icon: const Icon(
                      Icons.info,
                      color: Appcolors.buttoncolor,
                    ),
                    label: const Text(
                      "Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.lightprimary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.darkprimary,
                        shape: const StadiumBorder(
                            side: BorderSide(color: Appcolors.buttoncolor))),
                    onPressed: () async {
                      await FirebaseServices().signOut();
                      FirebaseAuth.instance.signOut();
                      Get.to(() => const Loginpage());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    label: const Text("Logout",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
