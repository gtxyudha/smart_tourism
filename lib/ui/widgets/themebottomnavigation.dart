import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class ThemeBottomNavigation extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  const ThemeBottomNavigation({
    Key? key,
    required this.imageUrl,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imageUrl,
              ),
            ),
          ),
        ),
        Container(
          width: 30,
          height: 2,
          decoration: BoxDecoration(
            color: isSelected ? kPrimaryColor : kputihColor,
            borderRadius: BorderRadius.circular(defaultradius),
          ),
        )
      ],
    );
  }
}
