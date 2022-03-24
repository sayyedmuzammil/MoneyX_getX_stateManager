// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:money_management/main.dart';
import 'package:money_management/screens/Login_widget.dart';
import 'package:money_management/screens/forgot_pass.dart';
import 'package:money_management/screens/homeScreen.dart';

abstract class ThemeText {}

class SignUp_Screen extends StatefulWidget {
  const SignUp_Screen({Key? key}) : super(key: key);

  // Login_screen({this.currentSelected = 0, this.id});
  // int? id;
  // int currentSelected;

  @override
  State<SignUp_Screen> createState() => _SignUp_Screen();
}

class _SignUp_Screen extends State<SignUp_Screen> {
  var _selectedIndex = 0; 
  final _username = TextEditingController();

  final _password = TextEditingController();

  final _globalKey1 = GlobalKey<FormState>();
  // final formKey1 = GlobalKey<FormState>();
  VoidCallback? isAddclicked;
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Stack(
        children: [
          const widget_screen(),
          Container(
            margin:const EdgeInsets.all(60),
            child: Center(
              child: Padding(
                padding:const EdgeInsets.symmetric(
                  vertical: 80,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Stack(
                                //  direction: Axis.horizontal,
                                children: [
                                  FlutterToggleTab(
                                    selectedBackgroundColors:const [
                                      Styles.primary_black,
                                    ],
                                    unSelectedBackgroundColors: [
                                      Styles.primary_black.withOpacity(.2)
                                    ],

                                    width: 69, 

                                    borderRadius: 25,

                                    selectedIndex: _selectedIndex,
                                    selectedTextStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.w500),
                                    unSelectedTextStyle:const TextStyle(
                                        color: Styles.primary_black,
                                        fontSize: 17,
                                        fontFamily: 'nunito',
                                        fontWeight: FontWeight.w500),
                                    labels:const  ["Sign In", "Sign Up"],
                                    // icons: [Icons.person,Icons.pregnant_woman],
                                    selectedLabelIndex: (index) {
                                      // print("Selected Index $index");
                                      setState(() {
                                        _selectedIndex = index;
                                      });
                                    },
                                  ),

                                  // OutlinedButton(
                                  //   style: ElevatedButton.styleFrom(
                                  //       side: BorderSide(
                                  //           width: 1.5, color: Styles.primary_black),
                                  //       textStyle: TextStyle(
                                  //         fontSize: 17,
                                  //         color: Colors
                                  //             .black, /*  backgroundColor: Colors.red, */ /* Styles.primary_black, */
                                  //       ),
                                  //       // primary:Colors.white,
                                  //       shape: const StadiumBorder(),
                                  //       padding: EdgeInsets.symmetric(
                                  //         horizontal: 48,
                                  //         vertical: 10,
                                  //       )),
                                  //   onPressed: () {},
                                  //   child: Text(
                                  //     'Sign In',
                                  //     style: TextStyle(
                                  //       color: Styles.primary_black,
                                  //     ),
                                  //   ),
                                  // ),
                                ]),
                          ],
                        ),
                       const SizedBox(
                          height: 50, 
                        ),
                        _selectedIndex == 1
                            ? Form(
                              key: _globalKey1,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    elevation: 0,
                                    // width: 400, height: 50,
                                    child: TextFormField(
                                      controller: _username,
                                      decoration:const InputDecoration(
                                        // border: OutlineInputBorder(),
                                        hintText:
                                            'Enter Email or Username', /*  hintStyle: Styles.Normal15 */
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
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
                                        if (value == null ||
                                            value.isEmpty) {
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
                                        if (value == null ||
                                            value.isEmpty) {
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
                            )
                            : Form(
                              key: _globalKey1,
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                children: [
                                  Card(
                                    elevation: 0,
                                    // width: 400, height: 50,
                                    child: TextFormField(
                                      controller: _username,
                                      decoration:const InputDecoration(
                                        // border: OutlineInputBorder(),
                                        hintText:
                                            'Enter Email or Username', /*  hintStyle: Styles.Normal15 */
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty) {
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
                                        if (value == null ||
                                            value.isEmpty) {
                                          return 'Password is Required';
                                        }
                                        if (value != 'muzammil@123') {
                                          return 'Please Enter valid Password';
                                        }
                                      },
                                      decoration:const  InputDecoration(
                                        // border: OutlineInputBorder(),
                                        hintText: 'Password',
                                        // hintStyle: ,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    // margin: EdgeInsets,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Forgot_password()),
                                        );
                                      },
                                      child: const Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            color: Styles.primary_black,
                                            fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ],
                    ),
                    Row(
                      children: [
                        // Text("in the login screen",style: Styles.LoginHeader, ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(272, 60),
                            textStyle:const  TextStyle(
                              fontSize: 25,
                              color: Styles.primary_black,
                            ),
                            primary: Styles.primary_black,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                            HomeScreen()), (Route<dynamic> route) => false);
                          },
                          icon: const ImageIcon(
                            AssetImage("assets/export/simple_logo.png"),
                            // color: Colors.pink,
                            size: 50,
                          ),
                          label: Text(
                            _selectedIndex == 1 ? 'Sign Up' : 'Sign In',
                            style: Styles.LoginHeader,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
