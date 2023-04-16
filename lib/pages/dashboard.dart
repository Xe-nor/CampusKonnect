import 'package:campuskonnect/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/eventcard.dart';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

// ignore: camel_case_types
class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appbar(),
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                eventCard(
                  Context: context,
                  eventDescription:
                      "Cupidatat dolor elit proident fugiat eiusmod esse commodo irure. Ex officia incididunt nisi eiusmod id eiusmod enim cupidatat exercitation cillum ipsum. Amet tempor sint quis id non cillum aliquip esse nisi anim et eu adipisicing. Incididunt consequat consequat consectetur culpa id ut do quis mollit nisi et aliqua. Veniam non elit reprehenderit magna commodo commodo ex consectetur. Ullamco fugiat irure anim do tempor consequat enim cupidatat excepteur voluptate dolore. Pariatur dolore aliquip labore ullamco voluptate labore ipsum laboris fugiat labore officia voluptate do.",
                  eventDate: "12th october",
                  eventimage: "assets/images/event.jpg",
                  eventname: "Music Festival",
                  eventLocation: "Campus15",
                ),
                eventCard(
                  Context: context,
                  eventDescription:
                      "Cupidatat dolor elit proident fugiat eiusmod esse commodo irure. Ex officia incididunt nisi eiusmod id eiusmod enim cupidatat exercitation cillum ipsum. Amet tempor sint quis id non cillum aliquip esse nisi anim et eu adipisicing. Incididunt consequat consequat consectetur culpa id ut do quis mollit nisi et aliqua. Veniam non elit reprehenderit magna commodo commodo ex consectetur. Ullamco fugiat irure anim do tempor consequat enim cupidatat excepteur voluptate dolore. Pariatur dolore aliquip labore ullamco voluptate labore ipsum laboris fugiat labore officia voluptate do.",
                  eventDate: "12th october",
                  eventimage: "assets/images/event.jpg",
                  eventname: "Music Festival",
                  eventLocation: "Campus15",
                ),
                eventCard(
                  Context: context,
                  eventDescription:
                      "Cupidatat dolor elit proident fugiat eiusmod esse commodo irure. Ex officia incididunt nisi eiusmod id eiusmod enim cupidatat exercitation cillum ipsum. Amet tempor sint quis id non cillum aliquip esse nisi anim et eu adipisicing. Incididunt consequat consequat consectetur culpa id ut do quis mollit nisi et aliqua. Veniam non elit reprehenderit magna commodo commodo ex consectetur. Ullamco fugiat irure anim do tempor consequat enim cupidatat excepteur voluptate dolore. Pariatur dolore aliquip labore ullamco voluptate labore ipsum laboris fugiat labore officia voluptate do.",
                  eventDate: "12th october",
                  eventimage: "assets/images/event.jpg",
                  eventname: "Music Festival",
                  eventLocation: "Campus15",
                ),
                eventCard(
                  Context: context,
                  eventDescription:
                      "Cupidatat dolor elit proident fugiat eiusmod esse commodo irure. Ex officia incididunt nisi eiusmod id eiusmod enim cupidatat exercitation cillum ipsum. Amet tempor sint quis id non cillum aliquip esse nisi anim et eu adipisicing. Incididunt consequat consequat consectetur culpa id ut do quis mollit nisi et aliqua. Veniam non elit reprehenderit magna commodo commodo ex consectetur. Ullamco fugiat irure anim do tempor consequat enim cupidatat excepteur voluptate dolore. Pariatur dolore aliquip labore ullamco voluptate labore ipsum laboris fugiat labore officia voluptate do.",
                  eventDate: "12th october",
                  eventimage: "assets/images/event.jpg",
                  eventname: "Music Festival",
                  eventLocation: "Campus15",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

_appbar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(100),
    child: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Row(
          children: [
            Image.asset(
              "assets/images/onlyName.png",
              scale: 6,
            ),
          ],
        ),
      ),
    ),
  );
}
