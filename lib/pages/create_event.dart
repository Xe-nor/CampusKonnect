import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';


import '../widgets/textform.dart';
import 'package:get/get.dart';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
          isActive: _activeStepIndex >= 2,
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
                            height: 200,
                            width: 370,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.deepPurpleAccent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                                child: Text(
                              "UPLOAD EVENT POSTER",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 9),
                      child: CUstomButton(
                        title: "Pick From gallery",
                        icon: Icons.image_outlined,
                        onClick: () => getImage(ImageSource.gallery),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, right: 0, top: 5),
                      child: CUstomButton(
                        title: "Take photo",
                        icon: Icons.camera,
                        onClick: () => getImage(ImageSource.camera),
                      ),
                    ),
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
    final name = basename(imagePath);
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
          title: const Text(
            "Create Event",
            style: TextStyle(
              // color: Colors.white,
              // fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

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
            Container(
              child: ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    minimumSize: const Size(100, 50)),
                onPressed: () {},
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}

Widget CUstomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 320,
    height: 40,
    child: ElevatedButton(
        onPressed: onClick,
        child: Row(
          children: [
            Icon(icon),
            Text(title),
            SizedBox(
              width: 20,
            )
          ],
        )),
  );
}
