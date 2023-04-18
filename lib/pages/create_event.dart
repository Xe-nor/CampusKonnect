import 'package:campuskonnect/utils/routes.dart';
import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

import '../widgets/textform.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

int _activeStepIndex = 0;

class _CreateEventState extends State<CreateEvent> {
  List<Step> stepList() => [
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text(
            "Name & Description ",
            style: TextStyle(
                // color: Colors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              textform(
                isEmail: false,
                isObscure: false,
                hinttxt: "Name of the event",
                labeltxt: "Name",
                prefixIcon: null,
                suffixIcon: null,
                isPrefixIcon: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please name of the event';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              textform(
                hinttxt: "Description of the event",
                labeltxt: "Description",
                prefixIcon: null,
                suffixIcon: null,
                isEmail: false,
                isPrefixIcon: false,
                isObscure: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please name of the event';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
        //
        //
        //
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text(
            "Location, Time & Date ",
            style: TextStyle(
                // color: Colors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              textform(
                hinttxt: "Location of the Event",
                labeltxt: "Location",
                prefixIcon: null,
                suffixIcon: null,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please name of the event';
                  }
                  return null;
                },
              ),

              const SizedBox(
                height: 10,
              ),
              //
              //
              //

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: textform(
                        hinttxt: "Time",
                        labeltxt: "Time ",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please name of the event';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  //
                  //
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: textform(
                        hinttxt: "Date",
                        labeltxt: "Date ",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please name of the event';
                          }
                          return null;
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        //
        //
        //

        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text(
            "Branch & Batch",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: textform(
                        hinttxt: "Mention the branch of participants",
                        labeltxt: "Branch",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please mention the branch';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                  //

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: textform(
                        hinttxt: "Batch of the participants",
                        labeltxt: "Batch",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please mention the batch';
                          }
                          return null;
                        },
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        //
        //
        //

        Step(
          state: _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text(
            "Registration link & Image",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              textform(
                  hinttxt: "Link for registering in the event",
                  labeltxt: "Registration link"),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                child: Column(
                  children: [
                    _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(_image!,
                                width: 370, height: 200, fit: BoxFit.cover),
                          )
                        : Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.deepPurpleAccent),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                            child: Center(
                                child: Text("Upload event image",
                                    style: GoogleFonts.urbanist()))),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 155,
                          height: 35,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolors.buttoncolor),
                            onPressed: () => getImage(ImageSource.gallery),
                            icon: const Icon(
                              FontAwesomeIcons.image,
                              size: 15,
                              color: Appcolors.lightprimary,
                            ),
                            label: Text(
                              "Pick from gallery",
                              style: GoogleFonts.urbanist(
                                  fontSize: 14,
                                  color: Appcolors.lightprimary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 155,
                          height: 35,
                          child: ElevatedButton.icon(
                            onPressed: () => getImage(ImageSource.camera),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Appcolors.buttoncolor),
                            icon: const Icon(
                              FontAwesomeIcons.camera,
                              size: 15,
                              color: Appcolors.lightprimary,
                            ),
                            label: Text(
                              "Take Photo",
                              style: GoogleFonts.urbanist(
                                  fontSize: 14,
                                  color: Appcolors.lightprimary,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ];

  File? _image;

  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // final imgageTemporary = File(image.path);
      final imagePermanent = await saveFilePermanently(image.path);

      setState(() {
        this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.blueGrey,
          title:
              Text("Create Event", style: GoogleFonts.urbanist(fontSize: 30)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: Stepper(
                  currentStep: _activeStepIndex,
                  steps: stepList(),
                  onStepContinue: () {
                    if (_activeStepIndex < (stepList().length - 1)) {
                      _activeStepIndex += 1;
                    }
                    setState(() {});

                    if (_activeStepIndex == (stepList().length - 1)) {
                      // Navigator.pushNamed(context, MyRoutes.homeRoute);
                    }
                    setState(() {});
                  },
                  onStepCancel: () {
                    if (_activeStepIndex == 0) {
                      return;
                    }

                    _activeStepIndex -= 1;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
