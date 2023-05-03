// ignore_for_file: file_names

import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "CO\nDE",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                ),
              ),
              Text(
                "Verification",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Enter the verification code sent at \n email@email.com",
                textAlign: TextAlign.center,
                style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                showFieldAsBox: true,
                borderColor: Appcolors.secondary,
                disabledBorderColor: Appcolors.secondary,
                numberOfFields: 6,
                filled: true,
                fillColor: Appcolors.secondary,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolors.buttoncolor,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          side: BorderSide(color: Appcolors.buttoncolor))),
                  child: Text("Validate",
                      style: GoogleFonts.urbanist(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Appcolors.lightprimary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
