// ignore_for_file: must_be_immutable

import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/utils/bottomnavbar.dart';
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
          height: double.infinity,
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
                        icon: const Icon(FontAwesomeIcons.arrowLeft))
                  ],
                ),
              ),
              Positioned(
                top: 200,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Appcolors.darkprimary,
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
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
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
                          height: 15,
                        ),
                        icondetailpair(
                            detail: 'StartTime', icon: FontAwesomeIcons.clock),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Text("MORE INFORMATION",
                                style: GoogleFonts.urbanist(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        icondetailpair(
                            detail: 'Total-Time',
                            icon: FontAwesomeIcons.hourglass),
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
                        Row(
                          children: [
                            Text("DESCRIPTION",
                                style: GoogleFonts.urbanist(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 145,
                          child: Text(
                            "Velit magna eu sunt eu laboris pariatur. Duis sunt exercitation occaecat irure duis consectetur. Tempor deserunt fugiat do veniam sit dolor non. Tempor consequat consequat non eu officia ut minim reprehenderit ea. Cillum nostrud eu nulla et amet. Esse cillum ipsum nulla reprehenderit ut ut occaecat ullamco cupidatat ut id id occaecat. Nostrud sint fugiat et incididunt adipisicing reprehenderit aliquip duis.",
                            maxLines: 8,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppButtons(
                                  size: 60,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  isIcon: true,
                                  icon: FontAwesomeIcons.heart,
                                  backgroundColor:
                                      const Color.fromARGB(87, 87, 76, 244),
                                  borderColor: Appcolors.buttoncolor),
                              const SizedBox(
                                width: 15,
                              ),
                              ResponsiveButton(
                                isResponsive: true,
                                width: double.maxFinite,
                              ),
                              const SizedBox(
                                width: 10,
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
          ? Center(
              child: Text("Register",
                  style: GoogleFonts.urbanist(
                      fontSize: 80, fontWeight: FontWeight.w700)))
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
          color: Appcolors.buttoncolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            isResponsive == true
                ? Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: Text(
                      "Register",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Appcolors.lightprimary),
                    ),
                  )
                : Container(),
            //sImage.asset("img/button-one.png"),/
          ],
        ),
      ),
    );
  }
}
