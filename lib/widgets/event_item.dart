import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/eventdetail.dart';
import '../utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icondetailpair.dart';

//

class EventItem extends StatelessWidget {
  const EventItem({
    Key? key,
    //required this.context,
    required this.id,
    //required this.eventImage,
    required this.eventName,
    required this.eventDescription,
    required this.eventDate,
    required this.eventLocation,
    required this.eventTime,
  }) : super(key: key);

  //final BuildContext context;
  final String id;
  //final String eventImage= "assets/images/event.jpg";
  final String eventName;
  final String eventDescription;
  final String eventDate;
  final String eventLocation;
  final String eventTime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const eventdetail());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: const Color.fromARGB(255, 13, 16, 22), width: 1),
            color: Appcolors.secondary,
          ),
          height: 255,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(
                  "assets/images/event.jpg",
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
                          eventName,
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
                        icondetailpair(
                            detail: eventDate, icon: FontAwesomeIcons.calendar),
                        icondetailpair(
                            detail: eventLocation,
                            icon: FontAwesomeIcons.locationPin),
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
                            maxLines: 3,
                            style: GoogleFonts.urbanist(
                              fontWeight: FontWeight.w500,
                            ),
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
}
