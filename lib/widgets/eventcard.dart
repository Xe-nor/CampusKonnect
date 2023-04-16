import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/eventdetail.dart';
import '../utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget eventCard({
  // ignore: non_constant_identifier_names
  required Context,
  required eventimage,
  required eventname,
  required eventDescription,
  required eventDate,
  required eventLocation,
}) {
  return GestureDetector(
    onTap: () {
      Get.to(const eventdetail());
    },
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        // padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Appcolors.secondary,
        ),
        height: 240,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                eventimage,
                height: 130,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        eventname,
                        style: GoogleFonts.urbanist(
                          fontSize: 26,
                        ),
                      ),
                    ],
                  ), //!eventname
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            const Icon(
                              FontAwesomeIcons.calendar,
                              size: 15,
                              color: Appcolors.buttoncolor,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                eventDate,
                                style: GoogleFonts.urbanist(
                                  color: Appcolors.buttoncolor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.location_on,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          eventLocation,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          eventDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// ignore: camel_case_types
// class eventcard extends StatelessWidget {
//   const eventcard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: const Color.fromARGB(255, 48, 45, 36)),
//         height: 230,
//         // color: Color.fromARGB(255, 78, 26, 26),
//         child: GestureDetector(
//           onTap: () {
//             Get.to(const eventdetail());
//           },
//           child: Column(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8.0),
//                 child: Image.asset(
//                   "assets/images/event.jpg",
//                   height: 110,
//                   width: double.infinity,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "EVENT NAME",
//                     style: Theme.of(context).textTheme.headlineSmall,
//                   ),
//                   OutlinedButton(
//                     onPressed: () {},
//                     child: const Text(
//                       "Register",
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: const [
//                   Icon(
//                     Icons.date_range,
//                     size: 15,
//                   ),
//                   Text(" date of event")
//                 ],
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Row(
//                 children: const [
//                   Expanded(
//                     child: Text(
//                       "awdadawd wadawdawd awddddddawdawd awdddddddddddddaw dawwwwwwwwww awdddddddd awdd awddddddd adw daw wad awd  aw da wd aw dawdaw d awd aw da wd aw dw ad ",
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
