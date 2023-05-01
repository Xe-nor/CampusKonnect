import 'package:flutter/material.dart';
import 'package:campuskonnect/utils/theme.dart';
//import 'package:campuskonnect/widgets/eventcard.dart';
//import 'package:campuskonnect/widgets/event_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventCreate extends StatefulWidget {
  const EventCreate({super.key});
  @override
  State<EventCreate> createState() => _EventCreateState();
}

class _EventCreateState extends State<EventCreate> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String evName = '', location = '', description = '', time = '', date = '';

  void _saveItem() async {
    if (formKey.currentState != null) {
      if (!formKey.currentState!.validate()) {
        formKey.currentState!.save();
      }
    }
    final url = Uri.https(
        'campuskonnect-3e383-default-rtdb.firebaseio.com','event-list3.json');
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'eventDate': date,
          'eventDescription': description,
          'eventLocation': location,
          'eventTime': time,
          //'eventImage': "assets/images/event.jpg",
          'eventName': evName,
        }));
    //print(response.body);
    //print(response.statusCode);

    if (!context.mounted) {
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new event'),
      ),
      body: SingleChildScrollView  ( 
        child:  Padding(
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
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Time'),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Time is empty';
                }
                return '';
              },
              onSaved: (input) {
                if (input != null) {
                  time = input;
                }
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text('Date'),
              ),
              validator: (input) {
                if (input == null || input.isEmpty) {
                  return 'Date is empty';
                }
                return '';
              },
              onSaved: (input) {
                if (input != null) {
                  date = input;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveItem,
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
      )
    );
  }
}
