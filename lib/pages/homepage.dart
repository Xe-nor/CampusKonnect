import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/create_event.dart';
import 'package:campuskonnect/pages/dashboard.dart';
import 'package:campuskonnect/pages/profilepage.dart';
import 'package:campuskonnect/pages/search.dart';
import 'bookmark.dart';
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
    bookmark(),
    CreateEvent(),
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
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: "Create Event"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
