// import 'package:campuskonnect/pages/splashscreen.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:campuskonnect/pages/add_event.dart';
//import '../widgets/eventcard.dart';
import 'package:campuskonnect/widgets/event_item.dart';

// ignore: camel_case_types
class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

// ignore: camel_case_types
class _dashboardState extends State<dashboard> {
  final List<EventItem> _eventItm = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<EventItem>(
      MaterialPageRoute(
        builder: (ctx) => const EventCreate(),
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _eventItm.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No Events Available'));
    if(_eventItm.isNotEmpty) {
      content = ListView.builder(
        itemCount: _eventItm.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              EventItem(
                  eventDescription: _eventItm[index].eventDescription,
                  eventDate: "12th october",
                  eventImage: "assets/images/event.jpg",
                  eventName: _eventItm[index].eventName,
                  eventLocation: _eventItm[index].eventLocation,
                  eventTime: '12:30hrs'),
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
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
