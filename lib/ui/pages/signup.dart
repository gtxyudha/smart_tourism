import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/auth_cubit.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';
import 'package:smart_tourism/ui/widgets/themeinput.dart';

// ignore: must_be_immutable
class Signup extends StatelessWidget {
  final TextEditingController usernameController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController alamatController =
      TextEditingController(text: '');
  final TextEditingController notelpController =
      TextEditingController(text: '');

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
            ThemeInput(
              hintText: 'Username',
              controller: usernameController,
            ),
            SizedBox(height: 19),
            ThemeInput(
              hintText: 'Email',
              controller: emailController,
            ),
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
              controller: passwordController,
            ),
            SizedBox(height: 19),
            ThemeInput(
              hintText: 'Address',
              controller: alamatController,
            ),
            SizedBox(height: 19),
            ThemeInput(
              hintText: 'Phone',
              controller: notelpController,
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
                  title: 'Sign Up',
                  width: 286,
                  margin: EdgeInsets.only(top: 50),
                  onPressed: () {
                    context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        username: usernameController.text,
                        alamat: alamatController.text,
                        notelp: notelpController.text);
                  },
                );
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
