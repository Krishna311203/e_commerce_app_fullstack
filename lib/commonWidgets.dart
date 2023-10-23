import 'package:flutter/material.dart';

// class CustomFormTextField extends StatelessWidget {
//   final TextEditingController controller;

var textInputDecoration = InputDecoration(
  filled: true, // Add a background color
  fillColor: const Color.fromARGB(46, 154, 153, 153), // Add an icon prefix
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0), // Rounded edges
    borderSide: const BorderSide(color: Colors.grey), // Border color
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0), // Rounded edges
    borderSide: const BorderSide(color: Colors.grey), // Focused border color
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0), // Rounded edges
    borderSide: const BorderSide(color: Colors.grey), // Enabled border color
  ),
  errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2)),

  labelStyle: const TextStyle(
      color: Color.fromARGB(163, 232, 230, 230)), // Add enabled border
);
void showsnackbar({context, color, message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: "Ok",
      onPressed: (() {}),
      textColor: Colors.white,
    ),
  ));
}



