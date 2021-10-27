import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class ThemeButton extends StatelessWidget {
  final String title;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const ThemeButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    required this.onPressed,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50,
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultradius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: putihTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
