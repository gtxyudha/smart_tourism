import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/auth_cubit.dart';
import 'package:smart_tourism/cubit/page_cubit.dart';
import 'package:smart_tourism/ui/pages/forgotpassword.dart';
import 'package:smart_tourism/ui/pages/signin.dart';
import 'package:smart_tourism/ui/pages/mainpage.dart';
import 'package:smart_tourism/ui/pages/signup.dart';
import 'package:smart_tourism/ui/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(SmartTourism());
}

class SmartTourism extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Splash(),
          '/login': (context) => SignIn(),
          '/sign-up': (context) => Signup(),
          '/main-page': (context) => MainPage(),
          '/forgot-password': (context) => ForgotPassword(),
        },
      ),
    );
  }
}
