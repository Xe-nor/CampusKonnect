import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/theme.dart';

Widget textform(
    {required hinttxt,
    final isdark = false,
    required labeltxt,
    MaxLengthEnforcement? maxlen,
    IconData? prefixIcon,
    IconData? suffixIcon,
    TextInputType? type,
    bool isPrefixIcon = false,
    bool isautofocus = false,
    bool isObscure = true,
    TextEditingController? controller,
    Function? validator,
    Function? onChanged,
    Function? onSaved}) {
  return SizedBox(
    height: 55,
    child: TextFormField(
      autofocus: isautofocus,
      onChanged: (value) => onChanged!(value),
      onSaved: (newValue) => onSaved!(newValue),
      validator: (input) => validator!(input),
      obscureText: isObscure,
      keyboardType: type,
      controller: controller,
      maxLengthEnforcement: maxlen,
      decoration: InputDecoration(
        labelStyle: GoogleFonts.montserrat(
          fontSize: 15,
        ),
        labelText: labeltxt,
        hintStyle: GoogleFonts.montserrat(
          fontSize: 14,
        ),
        floatingLabelStyle: const TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
        hintText: hinttxt,
        fillColor: Appcolors.secondary,
        filled: true,
        enabledBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          // borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIcon: isPrefixIcon
            ? Icon(
                prefixIcon,
                size: 18,
                color: const Color.fromARGB(255, 255, 255, 255),
              )
            : null,
        // prefixIconColor: const Color(0xffffffff),
      ),
    ),
  );
}
