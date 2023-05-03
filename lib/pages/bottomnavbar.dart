import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/create_event.dart';
import 'package:campuskonnect/pages/dashboard2.dart';
import 'package:campuskonnect/pages/profilepage.dart';
import 'package:campuskonnect/pages/search.dart';
import 'package:get/get.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
// import 'package:campuskonnect/pages/profilepage.dart';
// import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  List pages = const [
    dashboard(),
    search(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments;
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SnakeNavigationBar.color(
        shadowColor: Appcolors.buttoncolor,
        shape: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        snakeViewColor: Appcolors.buttoncolor,
        behaviour: SnakeBarBehaviour.floating,
        elevation: 10,
        snakeShape: SnakeShape.rectangle,
        selectedItemColor: Appcolors.lightprimary,
        unselectedItemColor: Appcolors.buttoncolor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
