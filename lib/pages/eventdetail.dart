// // ignore_for_file: must_be_immutable

// import 'package:campuskonnect/utils/theme.dart';

// import 'package:flutter/material.dart';
// import 'package:campuskonnect/pages/bottomnavbar.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../widgets/icondetailpair.dart';
// import 'package:campuskonnect/pages/add_event.dart';
// import 'package:campuskonnect/widgets/event_item.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';


// // ignore: camel_case_types
// class eventdetail extends StatefulWidget {
//   const eventdetail({super.key});

//   @override
//   State<eventdetail> createState() => _eventdetailState();
// }

// // ignore: camel_case_types
// class _eventdetailState extends State<eventdetail> {

    

//     List<EventItem> _eventItm = [];
  

//   void _loadItems() async {
//     final url = Uri.https(
//         'campuskonnect-3e383-default-rtdb.firebaseio.com', 'event-list5.json');
//     final response = await http.get(url);
//     //print(response.body);
//     if (response.body == 'null') {
//       return;
//     }
//     final Map<String, dynamic> listData = json.decode(response.body);
//     final List<EventItem> loadedItems = [];
//     for (final item in listData.entries) {
//       // if (listData.entries != null) {
//       loadedItems.add(EventItem(
//           id: item.key,
//           //eventImage: "assets/images/event.jpg",
//           eventName: item.value['eventName'],
//           eventDescription: item.value['eventDescription'],
//           eventDate: item.value['eventDate'],
//           eventLocation: item.value['eventLocation'],
//           eventTime: item.value['eventTime'],
//           eventBatch: item.value['eventBatch'],
//           eventBranch:item.value['eventBranch'],
//           eventDuration: item.value['eventDuration'],
//           eventRLink:item.value['eventRLink']));
//       //}
//     }
//     setState(() {
//       _eventItm = loadedItems;
//     });
//   }

//   void _addItem() async {
//     await Navigator.of(context).push<EventItem>(
//       MaterialPageRoute(
//         builder: (ctx) => const EventCreate(),
//       ),
//     );
//     _loadItems();
//   }

//   @override
//   void initState() {
   
//     super.initState();
//     _loadItems();
//   }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: double.maxFinite,
//           height: double.infinity,
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 right: 0,
//                 child: SizedBox(
//                   width: double.maxFinite,
//                   // height: 300,
//                   child: Image.asset(
//                     "assets/images/event.jpg",
//                     fit: BoxFit.contain,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 10,
//                 top: 0,
//                 child: Row(
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                           Get.to(const Homepage());
//                         },
//                         icon: const Icon(FontAwesomeIcons.arrowLeft))
//                   ],
//                 ),
//               ),
//               Positioned(
//                 top: 200,
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height,
//                   decoration: const BoxDecoration(
//                       color: Appcolors.darkprimary,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30))),
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text('Event Name',
//                                 style: GoogleFonts.urbanist(
//                                     fontSize: 24.0,
//                                     fontWeight: FontWeight.w500))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         icondetailpair(
//                             detail: 'Location',
//                             icon: FontAwesomeIcons.locationPin),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         icondetailpair(
//                             detail: 'Date', icon: FontAwesomeIcons.calendar),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         icondetailpair(
//                             detail: 'StartTime', icon: FontAwesomeIcons.clock),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Text("MORE INFORMATION",
//                                 style: GoogleFonts.urbanist(
//                                     fontSize: 24.0,
//                                     fontWeight: FontWeight.w500))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         icondetailpair(
//                             detail: 'Total-Time',
//                             icon: FontAwesomeIcons.hourglass),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         icondetailpair(
//                             detail: 'Branch',
//                             icon: FontAwesomeIcons.bookOpenReader),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         icondetailpair(
//                             detail: 'Batch', icon: FontAwesomeIcons.user),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             Text("DESCRIPTION",
//                                 style: GoogleFonts.urbanist(
//                                     fontSize: 24.0,
//                                     fontWeight: FontWeight.w500))
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         const SizedBox(
//                           height: 145,
//                           child: Text(
//                             "DUMMY",
//                             maxLines: 8,
//                             overflow: TextOverflow.clip,
//                           ),
//                         ),
//                         Positioned(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               AppButtons(
//                                   size: 60,
//                                   color:
//                                       const Color.fromARGB(255, 255, 255, 255),
//                                   isIcon: true,
//                                   icon: FontAwesomeIcons.heart,
//                                   backgroundColor:
//                                       const Color.fromARGB(87, 87, 76, 244),
//                                   borderColor: Appcolors.buttoncolor),
//                               const SizedBox(
//                                 width: 15,
//                               ),
//                               ResponsiveButton(
//                                 isResponsive: true,
//                                 width: double.maxFinite,
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AppButtons extends StatelessWidget {
//   final Color color;
//   String? text;
//   IconData? icon;
//   final Color backgroundColor;
//   double size;
//   final Color borderColor;
//   bool? isIcon;

//   AppButtons(
//       {Key? key,
//       this.isIcon = false,
//       this.text = "Hi",
//       this.icon,
//       required this.size,
//       required this.color,
//       required this.backgroundColor,
//       required this.borderColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//           border: Border.all(
//             color: borderColor,
//             width: 1.0,
//           ),
//           borderRadius: BorderRadius.circular(15),
//           color: backgroundColor),
//       child: isIcon == false
//           ? Center(
//               child: Text("Register",
//                   style: GoogleFonts.urbanist(
//                       fontSize: 80, fontWeight: FontWeight.w700)))
//           : Center(child: Icon(icon, color: color)),
//     );
//   }
// }

// class ResponsiveButton extends StatelessWidget {
//   bool? isResponsive;
//   double? width;
//   ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: Container(
//         width: isResponsive == true ? double.maxFinite : width,
//         height: 60,
//         decoration: BoxDecoration(
//           color: Appcolors.buttoncolor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Row(
//           mainAxisAlignment: isResponsive == true
//               ? MainAxisAlignment.spaceBetween
//               : MainAxisAlignment.center,
//           children: [
//             isResponsive == true
//                 ? Container(
//                     margin: const EdgeInsets.only(left: 100),
//                     child: Text(
//                       "Register",
//                       style: GoogleFonts.urbanist(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: Appcolors.lightprimary),
//                     ),
//                   )
//                 : Container(),
//             //sImage.asset("img/button-one.png"),/
//           ],
//         ),
//       ),
//     );
//   }
// }
