import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class PasswordInput extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const PasswordInput({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        style: putihTextStyle,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          fillColor: kinputColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultradius),
            borderSide: BorderSide.none,
          ),
          hintText: hintText,
          hintStyle: abuTextStyle,
          suffixIcon: Icon(
            Icons.visibility,
            color: kabuColor,
          ),
        ),
      ),
    );
  }
}
