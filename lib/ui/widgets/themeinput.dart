import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class ThemeInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  const ThemeInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        style: putihTextStyle,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: kinputColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultradius),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: abuTextStyle,
        ),
      ),
    );
  }
}
