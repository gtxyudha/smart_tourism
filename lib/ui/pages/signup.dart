import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

class Signup extends StatelessWidget {
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
              "Enter your data to register \n in smart tourism",
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
                  hintText: 'Nama',
                  hintStyle: abuTextStyle,
                ),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: putihTextStyle,
                decoration: InputDecoration(
                  fillColor: Color(0xff262A34),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultradius),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Username',
                  hintStyle: abuTextStyle,
                ),
              ),
            ),
            SizedBox(height: 19),
            Container(
              height: 50,
              child: TextFormField(
                style: putihTextStyle,
                obscureText: true,
                decoration: InputDecoration(
                  fillColor: kinputColor,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultradius),
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
            ),
            SizedBox(height: 19),
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
                  hintText: 'Alamat',
                  hintStyle: abuTextStyle,
                ),
              ),
            ),
            SizedBox(height: 19),
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
                  hintText: 'No Telepon',
                  hintStyle: abuTextStyle,
                ),
              ),
            ),
            SizedBox(height: 50),
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
                  'Sign Up',
                  style: putihTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
              ),
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
