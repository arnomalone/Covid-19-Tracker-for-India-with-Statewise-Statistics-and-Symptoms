import 'package:covid/Statewise.dart';
import 'package:covid/data.dart';
import 'package:covid/welcome.dart';
import 'package:flutter/material.dart';

import 'Dashboard.dart';
import 'More.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Dashboard(),
      routes: {
        Welcome.screenID : (context) => Welcome(),
        Dashboard.screenID : (context) => Dashboard(),
        Statewise.screenID : (context) => Statewise(),
        More.screenID : (context) => More(),
      },
    );
  }
}