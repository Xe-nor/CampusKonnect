import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/add_event.dart';
import 'package:campuskonnect/widgets/event_item.dart';
import 'package:http/http.dart' as http;

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
        'campuskonnect-3e383-default-rtdb.firebaseio.com', 'event-list2.json');
    final response = await http.get(url);
    //print(response.body);
    // if (response == null || response.body == 'null') {
    //   return;
    // }
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

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_eventItm.isNotEmpty) {
      content = ListView.builder(
        itemCount: _eventItm.length,
        itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction) {
              _removeItem(_eventItm[index]);
            },
            key: ValueKey(_eventItm[index].id),
            
            child: ListTile(
              title: Text(_eventItm[index].eventName),
              leading: Text(_eventItm[index].eventDescription),
              trailing: Text(
                _eventItm[index].eventLocation,
              ),
            ),

            
      ));
    }

    //

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
