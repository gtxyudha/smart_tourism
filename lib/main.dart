import 'package:flutter/material.dart';
import 'package:smart_tourism/ui/pages/forgotpassword.dart';
import 'package:smart_tourism/ui/pages/signin.dart';
import 'package:smart_tourism/ui/pages/mainpage.dart';
import 'package:smart_tourism/ui/pages/signup.dart';
import 'package:smart_tourism/ui/pages/splash.dart';

void main() => runApp(SmartTourism());

class SmartTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => SignIn(),
        '/sign-up': (context) => Signup(),
        '/main-page': (context) => MainPage(),
        '/forgot-password': (context) => ForgotPassword(),
      },
    );
  }
}
