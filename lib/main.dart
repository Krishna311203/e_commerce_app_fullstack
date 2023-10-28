import 'package:e_commerce_app_fullstack/Features/Landing/landing.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: "lib/.env_flutter");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leave - ECommerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Landing(),
    );
  }
}
