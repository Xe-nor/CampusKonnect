// // import 'package:flutter/material.dart';

// // class CreateEvent extends StatefulWidget {
// //   const CreateEvent({super.key});

// //   @override
// //   State<CreateEvent> createState() => _CreateEventState();
// // }

// // class _CreateEventState extends State<CreateEvent> {
// //   // final_formkey = GlobalKey(FormState);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Colors.blueGrey,
// //         title: Text(
// //           "CREATE  EVENT",
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 25,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20.0),
// //         child: ListView(
// //           children: [
// //             // Text(
// //             //   "Fill the following form",
// //             //   style: TextStyle(
// //             //       fontWeight: FontWeight.bold,
// //             //       color: Colors.white,
// //             //       fontSize: 25),
// //             // ),
// //             // Padding(
// //             //   padding: const EdgeInsets.only(
// //             //       left: 20, top: 10, right: 20, bottom: 10),
// //             //   child: Image.asset(
// //             //     "assets/images/undraw_fill_form_re_cwyf.png",
// //             //     fit: BoxFit.cover,
// //             //   ),
// //             // ),
// //             const Text("Fill the given form"),
// //             const SizedBox(
// //               height: 20,
// //             ),

// //             Form(
// //                 // key: final_formkey
// //                 child: Column(
// //               children: [
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     hintText: "Write your event name",
// //                     labelText: "Event Name",
// //                   ),
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     hintText: "What the event is all about",
// //                     labelText: "Description",
// //                   ),
// //                 ),
// //                 TextFormField(
// //                   decoration: InputDecoration(
// //                     hintText: "Where the event will be",
// //                     labelText: "Location",
// //                   ),
// //                 ),
// //                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       // hintText: "Where the event will be",
// //                       labelText: "Date",
// //                     ),
// //                   ),
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       // hintText: "Where the event will be",
// //                       labelText: "Time",
// //                     ),
// //                   ),
// //                 ]),
// //                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       // hintText: "Where the event will be",
// //                       labelText: "Batch",
// //                     ),
// //                   ),
// //                   TextFormField(
// //                     decoration: InputDecoration(
// //                       // hintText: "Where the event will be",
// //                       labelText: "Branch",
// //                     ),
// //                   ),
// //                 ]),
// //               ],
// //             ))
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// import 'package:flutter/material.dart';

// void main() => runApp(const CreateEvent());

// class CreateEvent extends StatelessWidget {
//   const CreateEvent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'CREATE  EVENT';

//     return MaterialApp(
//       title: appTitle,
//       themeMode: ThemeMode.dark,
//       darkTheme: ThemeData(
//         canvasColor: const Color(0xff22222C),
//         brightness: Brightness.dark,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: SingleChildScrollView(
//           child: const MyCustomForm(),
//         ),
//       ),
//     );
//   }
// }

// // Create a Form widget.
// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});

//   @override
//   MyCustomFormState createState() {
//     return MyCustomFormState();
//   }
// }

// // Create a corresponding State class.
// // This class holds data related to the form.
// class MyCustomFormState extends State<MyCustomForm> {
//   // Create a global key that uniquely identifies the Form widget
//   // and allows validation of the form.
//   //
//   // Note: This is a GlobalKey<FormState>,
//   // not a GlobalKey<MyCustomFormState>.
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     // Build a Form widget using the _formKey created above.
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 6),
//             TextFormField(
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 hintText: "Write your event name",
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   height: 0,
//                   color: Color(0XFF8d99ae),
//                 ),
//                 labelText: "Event Name",
//                 labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.yellow;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 }),
//               ),
//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please name of the event';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 6),
//             TextFormField(
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 hintText: "What the event is all about ",
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   height: 0,
//                   color: Color(0XFF8d99ae),
//                 ),
//                 labelText: "Description",
//                 labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.yellow;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 }),
//               ),

//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the description of event';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 6),
//             TextFormField(
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 hintText: "Where the event will be  ",
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   height: 0,
//                   color: Color(0XFF8d99ae),
//                 ),
//                 labelText: "Location",
//                 labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.yellow;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 }),
//               ),

//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the location of event';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 6),
//             TextFormField(
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 hintText: "Where the will be  ",
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   height: 0,
//                   color: Color(0XFF8d99ae),
//                 ),
//                 labelText: "Date",
//                 labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.yellow;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 }),
//               ),

//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the date of event';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 6),
//             Row(
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(right: 3.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: "Select date of the event (DD/MM/YYYY)",
//                         hintStyle: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                           height: 0,
//                           color: Color(0XFF8d99ae),
//                         ),
//                         labelText: "Date",
//                         labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                             final Color color =
//                                 states.contains(MaterialState.error)
//                                     ? Theme.of(context).colorScheme.error
//                                     : Colors.yellow;
//                             return TextStyle(color: color, letterSpacing: 1.3);
//                           },
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the date of event';
//                         }
//                         return null;
//                       },
//                       onTap: () async {
//                         final DateTime? selectedDate = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime.now(),
//                           lastDate: DateTime(2100),
//                         );
//                         if (selectedDate != null) {
//                           final formattedDate =
//                               "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
//                           // Set the selected date to the text field.
//                           TextEditingController().text = formattedDate;
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 3.0),
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         hintText: "Select time of the event (HH:MM AM/PM)",
//                         hintStyle: TextStyle(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 15,
//                           height: 0,
//                           color: Color(0XFF8d99ae),
//                         ),
//                         labelText: "Time",
//                         labelStyle: MaterialStateTextStyle.resolveWith(
//                           (Set<MaterialState> states) {
//                             final Color color =
//                                 states.contains(MaterialState.error)
//                                     ? Theme.of(context).colorScheme.error
//                                     : Colors.yellow;
//                             return TextStyle(color: color, letterSpacing: 1.3);
//                           },
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the time of event';
//                         }
//                         return null;
//                       },
//                       onTap: () async {
//                         final TimeOfDay? selectedTime = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (selectedTime != null) {
//                           // Set the selected time to the text field.
//                           TextEditingController().text =
//                               selectedTime.format(context).toString();
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 6),
//             TextFormField(
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 hintText: "Enter batch   ex : 2020-2024  ",
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   height: 0,
//                   color: Color(0XFF8d99ae),
//                 ),
//                 labelText: "Batch",
//                 labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.yellow;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 }),
//               ),

//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your batch';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 6),
//             TextFormField(
//               decoration: InputDecoration(
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                 hintText: "Enter the stream ",
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w400,
//                   fontSize: 15,
//                   height: 0,
//                   color: Color(0XFF8d99ae),
//                 ),
//                 labelText: "Batch",
//                 labelStyle: MaterialStateTextStyle.resolveWith(
//                     (Set<MaterialState> states) {
//                   final Color color = states.contains(MaterialState.error)
//                       ? Theme.of(context).colorScheme.error
//                       : Colors.yellow;
//                   return TextStyle(color: color, letterSpacing: 1.3);
//                 }),
//               ),

//               // The validator receives the text that the user has entered.
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your batch';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 6),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 15.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   // Validate returns true if the form is valid, or false otherwise.
//                   if (_formKey.currentState!.validate()) {
//                     // If the form is valid, display a snackbar. In the real world,
//                     // you'd often call a server or save the information in a database.
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Processing Data')),
//                     );
//                   }
//                 },
//                 child: Center(
//                     child: const Text(
//                   "Submit",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
//                 )),
//                 style: TextButton.styleFrom(
//                     backgroundColor: const Color(0xff5669FF),
//                     minimumSize: Size(100, 40)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //

import 'package:flutter/material.dart';

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
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Upload image",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    height: 0,
                    color: Color(0XFF8d99ae),
                  ),
                  labelText: "Image",
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
          padding: const EdgeInsets.all(1.0),
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
