import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../utils/routes.dart';
import '../widgets/textform.dart';

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
                height: 5,
              ),
              textform(
                  hinttxt: "Link for registering in the event",
                  labeltxt: "Registration link"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: Appcolors.buttoncolor,
                    minimumSize: const Size(320, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.image_input);
                },
                child: Text(
                  "Upload event image",
                  style: GoogleFonts.urbanist(
                      color: Appcolors.lightprimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ];

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Theme(
                    data: ThemeData(
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                            secondary: Colors.green,
                            background: Appcolors.buttoncolor)),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolors.buttoncolor,
                        shape: const StadiumBorder(
                            side: BorderSide(color: Appcolors.buttoncolor))),
                    child: Text("Submit",
                        style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: Appcolors.lightprimary,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
