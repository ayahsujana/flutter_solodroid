import 'package:flutter/material.dart';

import 'screen/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Youtube',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: "Raleway"
      ),
      home: HomePage(),
    );
  }
}
