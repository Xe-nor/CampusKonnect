// import 'package:campuskonnect/pages/splashscreen.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:campuskonnect/pages/add_event.dart';
//import '../widgets/eventcard.dart';
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
  List<EventItem> _found = [];

  void _loadItems() async {
    final url = Uri.https(
        'campuskonnect-3e383-default-rtdb.firebaseio.com', 'event-list3.json');
    final response = await http.get(url);
    //print(response.body);
    if (response.body == 'null') {
      return;
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<EventItem> loadedItems = [];
    for (final item in listData.entries) {
      // if (listData.entries != null) {
      loadedItems.add(EventItem(
          id: item.key,
          //eventImage: "assets/images/event.jpg",
          eventName: item.value['eventName'],
          eventDescription: item.value['eventDescription'],
          eventDate: item.value['eventDate'],
          eventLocation: item.value['eventLocation'],
          eventTime: item.value['eventTime']));
      //}
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
    // TODO: implement initState
    super.initState();
    _loadItems();
    _found = _eventItm;
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
                  eventTime: _eventItm[index].eventTime),
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
            IconButton(onPressed: _addItem, icon: const Icon(Icons.add))
          ],
        ),
        body: content);
  }
}
