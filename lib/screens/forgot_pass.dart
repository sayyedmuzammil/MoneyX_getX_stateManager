// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:money_management/constant_design.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/Login_widget.dart';

class Forgot_password extends StatelessWidget {
  const Forgot_password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final _username = TextEditingController();

    final _password = TextEditingController();

    final _globalKey = GlobalKey<FormState>();
    return Stack(
      children: [
        login_widget(),
        Container(
          margin: const EdgeInsets.all(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 80,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(270, 40),
                        backgroundColor: Styles.primary_black,
                        // side: BorderSide(
                        //     width: 1.5, color: Styles.primary_black),
                        textStyle: const TextStyle(
                          fontSize: 17,
                        ),
                        // primary:Colors.white,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: Styles.boldwhite,
                      ),
                    ),
                   const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _globalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            elevation: 0,
                            // width: 400, height: 50,
                            child: TextFormField(
                              controller: _username,
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText:
                                    'Enter Email or Username', /*  hintStyle: Styles.Normal15 */
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User Name is Required';
                                } else if (value.startsWith(" ")) {
                                  return "User name should not contain whitespace";
                                }
                                if (value != 'muzammil') {
                                  return 'Please Enter valid User name';
                                }
                              },
                            ),
                          ),
                          Card(
                            elevation: 0,
                            // width: 400, height: 50,
                            child: TextFormField(
                              controller: _password,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is Required';
                                }
                                if (value != 'muzammil@123') {
                                  return 'Please Enter valid Password';
                                }
                              },
                              decoration: const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'New Password',
                                // hintStyle: ,
                              ),
                            ),
                          ),
                          Card(
                            elevation: 0,
                            // width: 400, height: 50,
                            child: TextFormField(
                              controller: _password,
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password is Required';
                                }
                                if (value != 'muzammil@123') {
                                  return 'Please Enter valid Password';
                                }
                              },
                              decoration:const InputDecoration(
                                // border: OutlineInputBorder(),
                                hintText: 'Confirm Password',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text("in the login screen",style: Styles.LoginHeader, ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(272, 60),
                        textStyle: const TextStyle(
                          fontSize: 25,
                          color: Styles.primary_black,
                        ),
                        primary: Styles.primary_black,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage("assets/export/simple_logo.png"),
                        // color: Colors.pink,
                        size: 50,
                      ),
                      label:const Text(
                        'Sign Up',
                        style: Styles.LoginHeader,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
