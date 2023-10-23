import 'package:e_commerce_app_fullstack/Constants/global_variables.dart';
import 'package:e_commerce_app_fullstack/Features/Auth/Screens/LoginScreen.dart';
import 'package:e_commerce_app_fullstack/helperFunctions.dart';
import 'package:flutter/material.dart';

import '../Auth/Screens/RegisterScreen.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Image.asset(
          "Assets/Images/IntroScreen.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.38),
                  const Text(
                    "THE BEST APP FOR YOUR NEEDS",
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.6,
                      color: Color.fromARGB(159, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: size.height * 0.1),
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        nextScreen(context, RegisterScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        primary: Color.fromARGB(82, 251, 251, 251),
                        elevation: 0,
                      ),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                            color: Color.fromARGB(255, 227, 244, 238),
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SizedBox(
                    width: size.width * 0.7,
                    height: size.width * 0.13,
                    child: ElevatedButton(
                      onPressed: () {
                        nextScreen(context, LoginScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        primary: Color.fromARGB(92, 193, 252, 207),
                        elevation: 0,
                      ),
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Color.fromARGB(255, 233, 235, 234),
                            fontSize: 22,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
