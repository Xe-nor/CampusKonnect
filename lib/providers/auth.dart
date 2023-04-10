// ignore_for_file: unused_field

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment=AIzaSyB5HZi6RWOn2ClDnoBwfyh8T8TowD81gQ4 ');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, 'signUp?key');
  }

  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword?key');
  }
}
