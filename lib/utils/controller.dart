import 'package:flutter_application_1/pages/loginpage.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class Controller extends GetxController {
  static Controller get find => Get.find();
  RxBool animate = false.obs;
  Future startanimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 2000));
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => const Loginpage()));
    Get.to(() => const Loginpage(),
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 1500));
  }
}
