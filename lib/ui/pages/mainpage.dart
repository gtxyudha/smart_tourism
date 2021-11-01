import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/page_cubit.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/pages/home.dart';
import 'package:smart_tourism/ui/pages/order.dart';
import 'package:smart_tourism/ui/pages/settings.dart';
import 'package:smart_tourism/ui/pages/souvenir.dart';
import 'package:smart_tourism/ui/widgets/themebottomnavigation.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return Home();
        case 1:
          return Souvenir();
        case 2:
          return Order();
        case 3:
          return Settings();
        default:
          return Home();
      }
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
                index: 0,
                imageUrl: 'assets/menu_home.png',
              ),
              ThemeBottomNavigation(
                index: 1,
                imageUrl: 'assets/menu_oleh.png',
              ),
              ThemeBottomNavigation(
                index: 2,
                imageUrl: 'assets/menu_order.png',
              ),
              ThemeBottomNavigation(
                index: 3,
                imageUrl: 'assets/menu_akun.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kbackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
