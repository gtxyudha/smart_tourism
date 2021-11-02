import 'package:flutter/material.dart';
import 'package:smart_tourism/cubit/auth_cubit.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authfailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
            child: ThemeButton(
          title: 'Log Out',
          onPressed: () {
            context.read<AuthCubit>().logOut();
          },
          width: 220,
        ));
      },
    );
  }
}
