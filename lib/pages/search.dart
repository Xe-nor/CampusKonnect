import 'package:flutter/material.dart';

import '../widgets/textform.dart';

// ignore: camel_case_types
class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search),
        elevation: 2,
        backgroundColor: Colors.black,
        title: Container(
          width: double.infinity,
          height: 35,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(3)),
          child: textform(
            prefixIcon: Icons.search,
            hinttxt: "Enter the event you looking for",
            labeltxt: null,
            isObscure: false,
          ),
        ),
      ),
      body: const SingleChildScrollView(),
    );
  }
}
