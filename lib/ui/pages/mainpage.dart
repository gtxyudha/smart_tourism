import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/pages/home.dart';
import 'package:smart_tourism/ui/widgets/themebottomnavigation.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return Home();
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
              left: defaultmargin, right: defaultmargin, bottom: 0),
          decoration: BoxDecoration(
            color: kputihColor,
            borderRadius: BorderRadius.circular(defaultradius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ThemeBottomNavigation(
                imageUrl: 'assets/menu_home.png',
                isSelected: true,
              ),
              ThemeBottomNavigation(
                imageUrl: 'assets/menu_oleh.png',
              ),
              ThemeBottomNavigation(
                imageUrl: 'assets/menu_order.png',
              ),
              ThemeBottomNavigation(
                imageUrl: 'assets/menu_akun.png',
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
