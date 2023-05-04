// ignore_for_file: camel_case_types
import 'package:campuskonnect/utils/theme.dart';
import 'package:flutter/material.dart';
// import 'package:campuskonnect/pages/add_event.dart';
import 'package:campuskonnect/widgets/event_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _dashboardState();
}

class _dashboardState extends State<search> {
  List<EventItem> _eventItm = [];
  List<EventItem> _found = [];

  void _loadItems() async {
    final url = Uri.https(
        'campuskonnect-3e383-default-rtdb.firebaseio.com', 'event-list6.json');
    final response = await http.get(url);
    if (response.body == 'null') {
      return;
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<EventItem> loadedItems = [];
    for (final item in listData.entries) {
      loadedItems.add(EventItem(
          id: item.key,
          eventName: item.value['eventName'],
          eventDescription: item.value['eventDescription'],
          eventDate: item.value['eventDate'],
          eventLocation: item.value['eventLocation'],
          eventTime: item.value['eventTime'],
          eventBatch: item.value['eventBatch'],
          eventBranch: item.value['eventBranch'],
          eventDuration: item.value['eventDuration'],
          //eventRLink: item.value['eventRLink']
          ));
    }
    setState(() {
      _eventItm = loadedItems;
    });
  }

  

 

  void _runFilter(String enteredKeyword) {
    List<EventItem> results = [];
    if (enteredKeyword.isEmpty) {
      results = _eventItm;
    } else {
      results = _eventItm
          .where((index) => index.eventName
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _found = results;
    });
  }

  @override
  void initState() {
    
    super.initState();
    _loadItems();
    _found = _eventItm;
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No Events Available'));
    if (_eventItm.isNotEmpty) {
      content = ListView.builder(
        itemCount: _found.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            key: ValueKey(_found[index].id),
            children: [
              EventItem(
                  id: _found[index].id, //DateTime.now().toString(),
                  eventName: _found[index].eventName,
                  eventDescription: _found[index].eventDescription,
                  eventDate: _found[index].eventDate,
                  eventLocation: _found[index].eventLocation,
                  eventTime: _found[index].eventTime,
                  eventBatch: _found[index].eventBatch,
                  eventBranch: _found[index].eventBranch,
                  eventDuration: _found[index].eventDuration,
                  //eventRLink: _found[index].eventRLink
                  ),
            ],
          );
        },
      );
    }
    return Scaffold(
        body: KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(children: [
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                labelStyle: GoogleFonts.montserrat(
                  fontSize: 15,
                ),
                labelText: "Search",
                floatingLabelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                ),
                hintText: "Search Events",

                fillColor: Appcolors.secondary,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Appcolors.buttoncolor)),
                focusedBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Appcolors.buttoncolor)),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                // prefixIconColor: const Color(0xffffffff),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: content)
          ]),
        ),
      ),
    ));
  }
}
