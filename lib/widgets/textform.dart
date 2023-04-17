import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme.dart';

Widget textform(
    {required hinttxt,
    final isdark = false,
    required labeltxt,
    IconData? prefixIcon,
    IconData? suffixIcon,
    bool isEmail = false,
    bool isPrefixIcon = false,
    // required bool isSuffixIcon,
    bool isObscure = true,
    TextEditingController? controller,
    Function? validator}) {
  return SizedBox(
    height: 55,
    child: TextFormField(
      //onSaved: (newValue) => newValue,
      validator: (input) => validator!(input),
      obscureText: isObscure,
      keyboardType: isEmail ? TextInputType.emailAddress : null,
      controller: controller,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.montserrat(
          fontSize: 15,
        ),
        labelText: labeltxt,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 14,
        ),
        hintText: hinttxt,
        fillColor: Appcolors.contrast,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Appcolors.buttoncolor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Appcolors.buttoncolor, width: 1),
        ),
        prefixIcon: isPrefixIcon
            ? Icon(
                prefixIcon,
                size: 16,
                color: Appcolors.iconcolor,
              )
            : null,
        prefixIconColor: const Color(0xffffffff),
      ),
    ),
  );
}
