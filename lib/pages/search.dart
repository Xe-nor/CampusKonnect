import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../widgets/textform.dart';

// ignore: camel_case_types
class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: KeyboardDismisser(
        gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
        child: Scaffold(
          appBar: AppBar(
            leading: const Icon(Icons.search),
            title: Container(
              width: double.infinity,
              height: 55,
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
        ),
      ),
    );
  }
}
