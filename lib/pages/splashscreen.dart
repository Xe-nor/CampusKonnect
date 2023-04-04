import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/controller.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});
  // ignore: non_constant_identifier_names
  final Controllerop = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    Controllerop.startanimation();
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedOpacity(
              opacity: Controllerop.animate.value ? 1 : 0,
              duration: const Duration(milliseconds: 2000),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Center(
                  child: Image.asset(
                    "assets/images/nobglogo2.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
