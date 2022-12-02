// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:money_management/controller.dart';
import 'package:money_management/screens/homeScreen.dart';
// import 'package:money_management/screens/hometest.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db_control.openDB();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return 
     Sizer(
      builder: (context, orientation, deviceType) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money X',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
  //      initialRoute: '/',
      home: HomeScreen(),
    );
      });
  }
}
