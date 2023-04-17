// import 'package:campuskonnect/pages/splashscreen.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        title: const Image(
          image: AssetImage("assets/images/onlyName.png"),
          height: 100,
          width: 170,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 6,
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
            ],
          );
        },
      ),
    );
  }
}

// _appbar() {
//   return PreferredSize(
//     preferredSize: const Size.fromHeight(100),
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//       child: Container(
//         padding: const EdgeInsets.only(top: 50, left: 10, bottom: 10),
//         color: Colors.black,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/images/onlyName.png",
//               scale: 5.5,
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
