import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(top: 90, left: 29, right: 29),
        child: Column(
          children: [
            Text(
              "Enter your email, and \n we will send the password \n to your email",
              style: putihTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semibold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              child: TextFormField(
                style: putihTextStyle,
                decoration: InputDecoration(
                  fillColor: kinputColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultradius),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Email',
                  hintStyle: abuTextStyle,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 286,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(defaultradius),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Send',
                  style: putihTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Row(
                children: [
                  Text(
                    'Already have an account?',
                    style: putihTextStyle,
                  ),
                  SizedBox(width: 5),
                  new GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: new Text(
                      'Sign In',
                      style: putihTextStyle.copyWith(
                        fontWeight: semibold,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
