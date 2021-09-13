import 'package:flutter/material.dart';
import 'package:smart_tourism/pages/signup.dart';

void main() => runApp(SmartTourism());

class SmartTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}
