import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/dashboard.dart';
import 'package:flutter_application_1/pages/profilepage.dart';
import 'package:flutter_application_1/pages/search.dart';
import 'bookmark.dart';
// import 'package:flutter_application_1/pages/profilepage.dart';
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
    bookmark(),
    search(),
    profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 10,
        selectedItemColor: Colors.yellow,
        // showSelectedLabels: false,
        selectedFontSize: 10,
        showUnselectedLabels: false,
        unselectedFontSize: 0,
        backgroundColor: const Color(0xff2D2D3A),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Bookmarked"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
<<<<<<< HEAD
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Column(
            children: [
              const ListTile(),
            ],
          ),
        ),
      ),
=======
>>>>>>> 63186731752331c46212bfc52e097af37efd3ae3
    );
  }
}
