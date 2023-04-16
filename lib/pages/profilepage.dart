import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/homepage.dart';
// import 'package:flutter_application_1/pages/informationpage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:get/get.dart';

// import 'loginpage.dart';

// ignore: camel_case_types
class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

// ignore: camel_case_types
class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    int currentIndex = 3;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding:
              const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //!-----Profile pic
                const SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    // foregroundImage: AssetImage("assets/images/#"),
                    backgroundImage: AssetImage("assets/images/defaultpic.jpg"),
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
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                //!-----MENU
                SizedBox(
                  width: 300,
                  height: 50,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.yellow)),
                    onPressed: () {
                      showAboutDialog(
                        context: context,
                        applicationName: "CampusKonnect",
                        applicationVersion: "1.0.0",
                        applicationIcon: Image.asset("assets/images/logo.png"),
                        children: [
                          Text(
                            "Developers",
                            style: Theme.of(context).textTheme.headlineSmall,
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
                      color: Colors.grey,
                    ),
                    label: const Text("Information",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.yellow)),
                    onPressed: () {
                      Get.to(const Loginpage());
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.grey,
                    ),
                    label: const Text("Logout",
                        style: TextStyle(fontSize: 20, color: Colors.red)),
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
