import 'package:flutter/material.dart';

Widget textform(
    {hinttxt,
    labeltxt,
    IconData? icon,
    // ignore: avoid_types_as_parameter_names
    bool,
    TextEditingController? controller,
    Function? validator}) {
  return SizedBox(
    height: 45,
    child: TextFormField(
      validator: (input) => validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
        labelText: labeltxt,
        hintText: hinttxt,
        fillColor: const Color(0xff393948),
        filled: true,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    ),
  );
}
