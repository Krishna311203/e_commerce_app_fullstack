import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../commonWidgets.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showsnackbar(context, Colors.red, jsonDecode(response.body)['message']);
      break;
    case 500:
      showsnackbar(context, Colors.red, jsonDecode(response.body)['error']);
      break;
    default:
  }
}
