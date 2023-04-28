import 'package:flutter/material.dart';
import 'package:campuskonnect/utils/theme.dart';
//import 'package:campuskonnect/widgets/eventcard.dart';
import 'package:campuskonnect/widgets/event_item.dart';

class EventCreate extends StatefulWidget {
  const EventCreate({super.key});

  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String evName = '', location = '', description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Name of the event'),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Event name is empty';
                }
                return '';
              },
              onSaved: (input) {
                if (input != null) {
                  evName = input;
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Description'),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Description is empty';
                }
                return '';
              },
              onSaved: (input) {
                if (input != null) {
                  description = input;
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Location'),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Location is empty';
                }
                return '';
              },
              onSaved: (input) {
                if (input != null) {
                  location = input;
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // if (formKey.currentState!.validate()) {
                  //   formKey.currentState!.save();
                  // }

                  if (formKey.currentState != null) {
                    if (!formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  }
                  print(description);
                  print(location);
                  print(evName);
                  Navigator.of(context).pop(EventItem(
                    eventDate: "27/04/23",
                    eventDescription: description,
                    eventLocation: location,
                    eventTime: "12:30Hrs",
                    eventImage: "assets/images/event.jpg",
                    eventName: evName,
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolors.buttoncolor,
                    shape: const StadiumBorder(
                        side: BorderSide(color: Appcolors.buttoncolor))),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Appcolors.lightprimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
