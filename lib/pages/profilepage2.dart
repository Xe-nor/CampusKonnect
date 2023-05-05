// ignore_for_file: unused_import, camel_case_types

import 'package:campuskonnect/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:campuskonnect/pages/loginpage.dart';
import 'package:campuskonnect/services/firebase_services.dart';
import 'package:get/get.dart';

import 'package:campuskonnect/pages/add_event.dart';
import 'package:campuskonnect/widgets/event_item.dart';
import 'package:campuskonnect/widgets/user_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class profile extends StatefulWidget {
  //final String emailAddress;

  const profile({super.key});
  //const profile(this.emailAddress);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  List<UserItem> _eventItm = [];

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'campuskonnect-3e383-default-rtdb.firebaseio.com', 'users.json');
    //campuskonnect-3e383-default-rtdb.firebaseio.com
    final response = await http.get(url);

    if (response.body == 'null') {
      return;
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<UserItem> loadedItems = [];
    for (final item in listData.entries) {
      loadedItems.add(UserItem(
        id: item.key,
        userName: item.value['userName'],
        userEmail: item.value['userEmail'],
        userPhone: item.value['userPhone'],
      ));
    }
    setState(() {
      _eventItm = loadedItems;
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold (
        body: ListView.builder(itemBuilder: (BuildContext context, int index) {
          return Column(
              key: ValueKey(_eventItm[index].id),
              children: [
                UserItem(
                  id: _eventItm[index].id, 
                  userName: _eventItm[index].userName, 
                  userEmail: _eventItm[index].userEmail, 
                  userPhone: _eventItm[index].userPhone
                )
              ],
          );
        }),
     );     
  }
}
