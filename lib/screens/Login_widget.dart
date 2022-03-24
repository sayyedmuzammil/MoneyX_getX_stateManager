// ignore_for_file: file_names, camel_case_types, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_management/main.dart';

class widget_screen extends StatelessWidget {
  const widget_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return login_widget();
  }
}

class login_widget extends StatelessWidget {
  // var height;
//  login_widget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: Styles.primary_color,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: SvgPicture.asset(
                    "assets/export/Scroll Group 1.svg",
                    color: Styles.primary_black,
                  ),
                ), //Container
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 158.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 70,
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: SvgPicture.asset(
                              "assets/export/Scroll Group 2.svg",
                              color: Styles.primary_black,
                            ),
                          ),
                        ],
                      ),
                    ), //Flexible

                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: SvgPicture.asset(
                        "assets/export/Ellipse center.svg",
                        color: Styles.primary_black,
                      ),
                    ) //Flexible
                  ], //<widget>[]
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
            Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Styles.primary_black
                              .withOpacity(0.5), //color of shadow
                          spreadRadius: 5, //spread radius
                          blurRadius: 10,
                          // blur radius
                          offset: const Offset(0, 3), // changes position of shadow
                          //first paramerter of offset is left-right
                          //second parameter is top to down
                        ),
                        //you can set more BoxShadow() here
                      ],
                    ),
                    // color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 100),
                  ),
                ),
              ),
            ),
          ],
        ),

        // ),
      ),
    );
  }
}
