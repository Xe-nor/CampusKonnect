import 'package:flutter/material.dart';

// ignore: camel_case_types
class textform extends StatelessWidget {
  const textform({
    super.key,
    required this.labeltxt,
    required this.hinttxt,
    required this.icon,
    required this.obscure,
  });
  final String labeltxt, hinttxt;
  final IconData icon;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: labeltxt,
        hintText: hinttxt,
        fillColor: const Color(0xff393948),
        filled: true,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
