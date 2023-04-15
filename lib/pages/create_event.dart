import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

int _activeStepIndex = 0;

class _CreateEventState extends State<CreateEvent> {
  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: Text(
              "Name & Description ",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
                child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Write your event name",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 0,
                      color: Color(0XFF8d99ae),
                    ),
                    labelText: "Event Name",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).colorScheme.error
                          : Colors.yellow;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please name of the event';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                //
                //
                //
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "What the event is all about",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 0,
                      color: Color(0XFF8d99ae),
                    ),
                    labelText: "Description",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).colorScheme.error
                          : Colors.yellow;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please name of the event';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 6),
              ],
            ))),
        //
        //
        //

        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: Text(
              "Location, Time & Date ",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
                child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Where the event will be",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 0,
                      color: Color(0XFF8d99ae),
                    ),
                    labelText: "Location",
                    labelStyle: MaterialStateTextStyle.resolveWith(
                        (Set<MaterialState> states) {
                      final Color color = states.contains(MaterialState.error)
                          ? Theme.of(context).colorScheme.error
                          : Colors.yellow;
                      return TextStyle(color: color, letterSpacing: 1.3);
                    }),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please name of the event';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                //
                //
                //

                Row(children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Time of the event",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 0,
                          color: Color(0XFF8d99ae),
                        ),
                        labelText: "Time",
                        labelStyle: MaterialStateTextStyle.resolveWith(
                            (Set<MaterialState> states) {
                          final Color color =
                              states.contains(MaterialState.error)
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.yellow;
                          return TextStyle(color: color, letterSpacing: 1.3);
                        }),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please name of the event';
                        }
                        return null;
                      },
                    ),
                  )),

                  //
                  //
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Date of the event",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                height: 0,
                                color: Color(0XFF8d99ae),
                              ),
                              labelText: "Date",
                              labelStyle: MaterialStateTextStyle.resolveWith(
                                  (Set<MaterialState> states) {
                                final Color color =
                                    states.contains(MaterialState.error)
                                        ? Theme.of(context).colorScheme.error
                                        : Colors.yellow;
                                return TextStyle(
                                    color: color, letterSpacing: 1.3);
                              }),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please name of the event';
                              }
                              return null;
                            },
                          )))
                ])
              ],
            ))),
        //
        //
        //

        Step(
            state:
                _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: Text(
              "Branch & Batch",
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
                child: Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter the branch",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 0,
                          color: Color(0XFF8d99ae),
                        ),
                        labelText: "Branch",
                        labelStyle: MaterialStateTextStyle.resolveWith(
                            (Set<MaterialState> states) {
                          final Color color =
                              states.contains(MaterialState.error)
                                  ? Theme.of(context).colorScheme.error
                                  : Colors.yellow;
                          return TextStyle(color: color, letterSpacing: 1.3);
                        }),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please name of the event';
                        }
                        return null;
                      },
                    ),
                  )),

                  //
                  //
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Enter the Batch",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                height: 0,
                                color: Color(0XFF8d99ae),
                              ),
                              labelText: "Batch",
                              labelStyle: MaterialStateTextStyle.resolveWith(
                                  (Set<MaterialState> states) {
                                final Color color =
                                    states.contains(MaterialState.error)
                                        ? Theme.of(context).colorScheme.error
                                        : Colors.yellow;
                                return TextStyle(
                                    color: color, letterSpacing: 1.3);
                              }),
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please name of the event';
                              }
                              return null;
                            },
                          )))
                ])
              ],
            ))),
        //
        //
        //

        Step(
          state: _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: Text(
            "Registration link & Image",
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          content: Container(
              child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Give link so that user can register for event",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 0,
                    color: Color(0XFF8d99ae),
                  ),
                  labelText: "Registration link",
                  labelStyle: MaterialStateTextStyle.resolveWith(
                      (Set<MaterialState> states) {
                    final Color color = states.contains(MaterialState.error)
                        ? Theme.of(context).colorScheme.error
                        : Colors.yellow;
                    return TextStyle(color: color, letterSpacing: 1.3);
                  }),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // ElevatedButton(
              //   child: Text(
              //     "Upload Poster of the Event",
              //     style: TextStyle(color: Colors.black, fontSize: 20),
              //   ),
              //   style: TextButton.styleFrom(
              //       backgroundColor: Colors.lightGreenAccent,
              //       minimumSize: Size(300, 40)),
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.image_input);
              //   },
              // ),
            ],
          )),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "CREATE  EVENT",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 3),
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
    );
  }
}
