import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profilepage.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "codeee";

  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: const Color(0xff22222C),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(const Profile(),
                  transition: Transition.cupertinoDialog,
                  duration: const Duration(milliseconds: 1500));
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/images/defaultpic.jpg"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              const ListTile(
                

              ),
            ],
          ),
        ),
      ),
    );
  }
}
