import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/auth_cubit.dart';
import 'package:smart_tourism/cubit/wisata_cubit.dart';
import 'package:smart_tourism/models/wisata_model.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/wisatacard.dart';
import 'package:smart_tourism/ui/widgets/wisatatile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    context.read<WisataCubit>().fetchWisata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultmargin,
                right: defaultmargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, \n${state.user.username}',
                          style: putihTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6),
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: putihTextStyle,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              fillColor: kinputColor,
                              filled: true,
                              contentPadding: EdgeInsets.all(0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultradius),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Where  to holiday today?',
                              hintStyle: abuTextStyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/users.png'),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget topDestination(List<WisataModel> wisata) {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: wisata.map((WisataModel wisata) {
              return WisataCard(wisata);
            }).toList(),
          ),
        ),
      );
    }

    Widget newWisata(List<WisataModel> wisata) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultmargin,
          right: defaultmargin,
          bottom: 100,
        ),
        child: Column(
          children: [
            Text(
              'New This Destination',
              style: putihTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
            Column(
              children: wisata.map((WisataModel wisata) {
                return WisataTile(wisata);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<WisataCubit, WisataState>(
      listener: (context, state) {
        if (state is WisataFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is WisataSuccess) {
          return ListView(
            children: [
              header(),
              topDestination(state.wisata),
              newWisata(state.wisata),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
