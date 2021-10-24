import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(left: 0, right: 0),
          decoration: BoxDecoration(
            color: Color(0xffEFF5FB),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff181A20),
      body: Stack(
        children: [
          Text('Main Page'),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
