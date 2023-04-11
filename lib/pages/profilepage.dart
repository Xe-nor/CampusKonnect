import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
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

              profiletile(
                text: "Information",
                icon: Icons.info_outline_rounded,
                trailing: true,
                onPress: () {
                  // dialogbox(context);
                },
              ),

              profiletile(
                text: "Logout",
                icon: Icons.logout,
                textColor: Colors.red,
                trailing: false,
                onPress: () {
                  Get.to(const Loginpage());
                },
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       showAboutDialog(
              //         context: context,
              //         applicationName: "CampusKonnect",
              //         applicationVersion: "1.0.0",
              //         applicationIcon: Image.asset("assets/images/logo.png"),
              //       );
              //     },
              //     child: Text("data")),
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
    required this.onPress,
  });
  final String text;
  final IconData icon;
  final Color? textColor;
  final bool trailing;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onPress;
      },
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
