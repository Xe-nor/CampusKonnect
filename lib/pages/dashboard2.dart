// ignore_for_file: unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/add_event.dart';
import 'package:campuskonnect/widgets/event_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

// ignore: camel_case_types
class _dashboardState extends State<dashboard> {
  List<EventItem> _eventItm = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

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
        eventRLink: item.value['eventRLink'],
        eventBranch: item.value['eventBranch'],
        eventDuration: item.value['eventDuration'],
      ));
      // }
    }
    setState(() {
      _eventItm = loadedItems;
    });
  }

  void _addItem() async {
    await Navigator.of(context).push<EventItem>(
      MaterialPageRoute(
        builder: (ctx) => const EventCreate(),
      ),
    );
    _loadItems();
  }

  void _removeItem(EventItem item) {
    setState(() {
      _eventItm.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No Events Available'));
    if (_eventItm.isNotEmpty) {
      content = ListView.builder(
        itemCount: _eventItm.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            key: ValueKey(_eventItm[index].id),
            children: [
              EventItem(
                id: _eventItm[index].id, //DateTime.now().toString(),
                eventName: _eventItm[index].eventName,
                eventDescription: _eventItm[index].eventDescription,
                eventDate: _eventItm[index].eventDate,
                //eventImage: "assets/images/event.jpg",
                eventLocation: _eventItm[index].eventLocation,
                eventTime: _eventItm[index].eventTime,
                eventBatch: _eventItm[index].eventBatch,
                eventBranch: _eventItm[index].eventBranch,
                eventDuration: _eventItm[index].eventDuration,
                eventRLink: _eventItm[index].eventRLink,
              )
            ],
          );
        },
      );
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: false,
          title: const Image(
            image: AssetImage("assets/images/onlyName.png"),
            height: 150,
            width: 170,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: _addItem,
                icon: const Icon(
                  Icons.add_circle_outline,
                  size: 35,
                ))
          ],
        ),
        body: content);
  }
}
