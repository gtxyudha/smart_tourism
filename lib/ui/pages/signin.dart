import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 99, left: 29, right: 29),
        child: Column(
          children: [
            Center(
              child: Text(
                "Enter your data when \n Sign In correctly",
                style: putihTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semibold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 128),
            TextFormField(
              style: putihTextStyle,
              decoration: InputDecoration(
                fillColor: Color(0xff262A34),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultradius),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Email',
                hintStyle: abuTextStyle,
              ),
            ),
            SizedBox(height: 24),
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
            SizedBox(height: 11),
            Container(
              alignment: Alignment(1, 0.5),
              child: new GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgot-password');
                },
                child: new Text(
                  'Forgot My Password?',
                  style: putihTextStyle,
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment(1, 0.5),
            //   child: Text(
            //     'Forgot My Password?',
            //     style: putihTextStyle,
            //   ),
            // ),
            SizedBox(height: 87),
            Container(
              width: 286,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultradius),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/main-page');
                },
                child: Text(
                  'Sign In',
                  style: putihTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  Text(
                    "Don't have account?",
                    style: putihTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  SizedBox(width: 5),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: new Text(
                      "Sign Up",
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
