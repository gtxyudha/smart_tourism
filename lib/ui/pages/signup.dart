import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';
import 'package:smart_tourism/ui/widgets/themeinput.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 29, right: 29),
        child: Column(
          children: [
            Text(
              "Enter your data to register \n in smart tourism",
              style: putihTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            ThemeInput(hintText: 'Name'),
            SizedBox(height: 19),
            ThemeInput(hintText: 'Email'),
            SizedBox(height: 19),
            TextFormField(
              obscureText: true,
              style: putihTextStyle,
              decoration: InputDecoration(
                fillColor: kinputColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(17),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Password',
                hintStyle: abuTextStyle,
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kabuColor,
                ),
              ),
            ),
            SizedBox(height: 19),
            ThemeInput(hintText: 'Address'),
            SizedBox(height: 19),
            ThemeInput(hintText: 'Phone'),
            ThemeButton(
              title: 'Sign Up',
              width: 286,
              margin: EdgeInsets.only(top: 50),
              onPressed: () {
                Navigator.pushNamed(context, '/main-page');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11, left: 60),
              child: Row(
                children: [
                  Text(
                    "Already have an account?",
                    style: putihTextStyle,
                  ),
                  SizedBox(width: 5),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: new Text(
                      "Sign In",
                      style: putihTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
