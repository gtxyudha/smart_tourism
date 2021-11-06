import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/auth_cubit.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';
import 'package:smart_tourism/ui/widgets/themeinput.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;

  final TextEditingController passwordController =
      TextEditingController(text: '');

  final TextEditingController emailController = TextEditingController(text: '');

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
            ThemeInput(
              hintText: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 24),
            TextFormField(
              obscureText: _obscureText,
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
                suffixIcon: new GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: new Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: kabuColor,
                  ),
                ),
              ),
              controller: passwordController,
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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/main-page', (route) => false);
                } else if (state is Authfailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ThemeButton(
                  title: 'Sign In',
                  width: 286,
                  margin: EdgeInsets.only(top: 87),
                  onPressed: () {
                    context.read<AuthCubit>().signIn(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                  },
                );
              },
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
