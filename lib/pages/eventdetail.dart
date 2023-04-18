import 'package:campuskonnect/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/bottomnavbar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/icondetailpair.dart';

// ignore: camel_case_types
class eventdetail extends StatefulWidget {
  const eventdetail({super.key});

  @override
  State<eventdetail> createState() => _eventdetailState();
}

// ignore: camel_case_types
class _eventdetailState extends State<eventdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: SizedBox(
                  width: double.maxFinite,
                  // height: 300,
                  child: Image.asset(
                    "assets/images/event.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                top: 0,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.to(const Homepage());
                        },
                        icon: const Icon(Icons.menu))
                  ],
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 29, 29, 51),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("EVENT-NAME",
                                style: GoogleFonts.urbanist(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        icondetailpair(
                            detail: 'Location',
                            icon: FontAwesomeIcons.locationPin),
                        const SizedBox(
                          height: 10,
                        ),
                        icondetailpair(
                            detail: 'Date', icon: FontAwesomeIcons.calendar),
                        const SizedBox(
                          height: 8,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Text("MORE INFORMATION",
                                style: GoogleFonts.urbanist(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        icondetailpair(
                            detail: 'Total-Time', icon: FontAwesomeIcons.clock),
                        const SizedBox(
                          height: 10,
                        ),
                        icondetailpair(
                            detail: 'Branch',
                            icon: FontAwesomeIcons.bookOpenReader),
                        const SizedBox(
                          height: 10,
                        ),
                        icondetailpair(
                            detail: 'Batch', icon: FontAwesomeIcons.user),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 60,
                        ),
                        Row(
                          children: [
                            Text("DESCRIPTION",
                                style: GoogleFonts.urbanist(
                                    fontSize: 26.0,
                                    fontWeight: FontWeight.w700))
                          ],
                        ),
                        const SizedBox(
                          height: 230,
                        ),
                        Positioned(
                          bottom: 0,
                          child: Row(
                            children: [
                              AppButtons(
                                  size: 60,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  isIcon: true,
                                  icon: FontAwesomeIcons.heart,
                                  backgroundColor:
                                      Color.fromARGB(87, 87, 76, 244),
                                  borderColor: Appcolors.buttoncolor),
                              SizedBox(
                                width: 5,
                              ),
                              ResponsiveButton(
                                isResponsive: true,
                                width: double.maxFinite,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppButtons extends StatelessWidget {
  final Color color;
  String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButtons(
      {Key? key,
      this.isIcon = false,
      this.text = "Hi",
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor),
      child: isIcon == false
          ? Center(child: Text("Register"))
          : Center(child: Icon(icon, color: color)),
    );
  }
}

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key, this.width = 120, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text("Register"),
                    color: Colors.blue,
                  )
                : Container(),
            //sImage.asset("img/button-one.png"),/
          ],
        ),
      ),
    );
  }
}
