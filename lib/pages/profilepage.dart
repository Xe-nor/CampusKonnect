import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:get/get.dart';

import 'loginpage.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const Color(0xff22222C),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              const SizedBox(
                width: 120,
                height: 120,
                child: CircleAvatar(
                  // foregroundImage: AssetImage("assets/images/#"), //TODO : take picture from users dp
                  backgroundImage: AssetImage("assets/images/defaultpic.jpg"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nameabc",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
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
              //!---------------------------------------------------------------------------------MENU
              const profiletile(
                text: "Information",
                icon: Icons.info_outline_rounded,
                trailing: true,
              ),
              const profiletile(
                text: "Logout",
                icon: Icons.logout,
                textColor: Colors.red,
                trailing: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class profiletile extends StatelessWidget {
  const profiletile({
    super.key,
    required this.text,
    required this.icon,
    this.textColor,
    required this.trailing,
  });
  final String text;
  final IconData icon;
  final Color? textColor;
  final bool trailing;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(icon),
      ),
      title: Text(text,
          style:
              Theme.of(context).textTheme.titleLarge!.apply(color: textColor)),
      trailing: trailing
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
