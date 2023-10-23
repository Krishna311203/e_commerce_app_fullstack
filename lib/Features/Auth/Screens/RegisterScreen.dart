import 'package:e_commerce_app_fullstack/Features/Auth/Screens/LoginScreen.dart';
import 'package:e_commerce_app_fullstack/Features/Landing/landing.dart';
import 'package:e_commerce_app_fullstack/helperFunctions.dart';
import 'package:flutter/material.dart';

import '../../../commonWidgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Image.asset(
          "Assets/Images/Loginbg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 70, left: 30),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(135, 101, 100, 100),
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  ),
                  width: 50,
                  height: 50,
                  child: Image.asset("Assets/Icon/BackIcon.png",
                      color: Color.fromARGB(170, 163, 165, 165)),
                ),
              ),
              ClipRect(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(87, 101, 100, 100),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  width: size.width,
                  height: size.height * 0.75,
                  child: ClipRect(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: size.height * 0.06),
                            const Text("Register!",
                                style: TextStyle(
                                    color: Color.fromARGB(170, 234, 234, 234),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold)),
                            const Text("Create an account",
                                style: TextStyle(
                                    color: Color.fromARGB(170, 234, 234, 234),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(height: size.height * 0.05),
                            TextFormField(
                              controller: _nameController,
                              decoration: textInputDecoration.copyWith(
                                hintText: "Full Name",
                                label: const Text("Name"),
                                prefixIcon: const Icon(Icons.person_outline,
                                    color: Color.fromARGB(170, 164, 165, 163)),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: _emailController,
                              decoration: textInputDecoration.copyWith(
                                hintText: "Email Address",
                                label: const Text("Email"),
                                prefixIcon: const Icon(Icons.email_outlined,
                                    color: Color.fromARGB(170, 164, 165, 163)),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: _passwordController,
                              decoration: textInputDecoration.copyWith(
                                hintText: "Password",
                                label: const Text("Password"),
                                prefixIcon: const Icon(Icons.lock_outline,
                                    color: Color.fromARGB(170, 164, 165, 163)),
                              ),
                            ),
                            SizedBox(height: size.height * 0.02),
                            TextFormField(
                              controller: _cpasswordController,
                              decoration: textInputDecoration.copyWith(
                                hintText: "Enter Password",
                                label: const Text("Confirm Password"),
                                prefixIcon: const Icon(Icons.lock_outline,
                                    color: Color.fromARGB(170, 164, 165, 163)),
                              ),
                            ),
                            SizedBox(height: size.height * 0.04),
                            SizedBox(
                              width: size.width * 0.7,
                              height: size.width * 0.13,
                              child: ElevatedButton(
                                onPressed: () {
                                  nextScreenReplace(context, const Landing());
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25.0)),
                                  primary: Color.fromARGB(145, 86, 113, 92),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      color: Color.fromARGB(170, 234, 234, 234),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Already have an account?",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(170, 234, 234, 234),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                                TextButton(
                                  onPressed: () {
                                    nextScreenReplace(
                                        context, const LoginScreen());
                                  },
                                  child: const Text('Log In',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              170, 234, 234, 234),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          decoration:
                                              TextDecoration.underline)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
