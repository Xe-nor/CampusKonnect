import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme.dart';

Widget icondetailpair({
  required String detail, //28 april
  required IconData icon, //28 april
}) {
  return Padding(
    padding: const EdgeInsets.only(right: 20.0),
    child: Row(
      children: [
        const Icon(
          FontAwesomeIcons.calendar,
          size: 15,
          color: Appcolors.buttoncolor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            detail,
            style: GoogleFonts.urbanist(
              color: Appcolors.buttoncolor,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ),
      ],
    ),
  );
}
