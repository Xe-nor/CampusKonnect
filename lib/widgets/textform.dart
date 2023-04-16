import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class textform extends StatelessWidget {
//   const textform({
//     super.key,
//     required this.labeltxt,
//     required this.hinttxt,
//     required this.icon,
//     required this.obscure,
//   });
//   final String labeltxt, hinttxt;
//   final IconData icon;
//   final bool obscure;
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: obscure,
//       decoration: InputDecoration(
//         labelText: labeltxt,
//         hintText: hinttxt,
//         fillColor: const Color(0xff393948),
//         filled: true,
//         enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
//         prefixIcon: Icon(icon),
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }
// }
Widget textform(
    {hinttxt,
    labeltxt,
    IconData? icon,
    bool,
    TextEditingController? controller,
    Function? validator,
    Function? onSaved}) {
  return Container(
    height: 45,
    child: TextFormField(
      onSaved: (newValue) => newValue,
      validator: (input) => validator!(input),
      obscureText: bool,
      controller: controller,
      decoration: InputDecoration(
        // contentPadding:EdgeInsets.only(top: 5),
        // errorStyle: TextStyle(fontSize: 0),
        // hintStyle: TextStyle(
        //   color: AppColors.genderTextColor,
        // ),
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
