import 'dart:convert';
import 'package:e_commerce_app_fullstack/commonWidgets.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Constants/errorhandling.dart';
import '../../../models/user.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../providers/user_providers.dart';

final String apiUrl = dotenv.env['SERVER_URL']!;

class AuthService {
  Future<void> signup({
    required BuildContext context,
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      User user = User(
          id: '',
          fullName: fullName,
          email: email,
          password: password,
          address: '',
          type: '',
          token: '');

      final response = await http.post(
        Uri.parse('$apiUrl/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showsnackbar(
            context,
            Colors.green,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
      showsnackbar(context, Colors.red, e.toString());
    }
  }

  Future<void> signin({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(response.body);
          await prefs.setString('x-auth-token', jsonDecode(response.body)['token']);
          showsnackbar(
            context,
            Colors.green,
            'Logged in Successfully! ',
          );
        },
      );
    } catch (e) {
      showsnackbar(context, Colors.red, e.toString());
    }
  }
}
