import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/auth_cubit.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/wisatacard.dart';
import 'package:smart_tourism/ui/widgets/wisatatile.dart';

class Home extends StatelessWidget {
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

    Widget topDestination() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              WisataCard(
                nama: 'Pasar Klewer',
                alamat: 'Solo City',
                imageUrl: 'assets/pasarklewer.png',
                rating: 4.8,
              ),
              WisataCard(
                nama: 'Tengir Park',
                alamat: 'Ngargoyoso',
                imageUrl: 'assets/tengirpark.png',
                rating: 4.7,
              ),
              WisataCard(
                nama: 'Candi Cetho',
                alamat: 'Karanganyar',
                imageUrl: 'assets/candicetho.png',
                rating: 4.8,
              ),
              WisataCard(
                nama: 'Keraton Solo',
                alamat: 'Solo',
                imageUrl: 'assets/keratonsolo.png',
                rating: 5.0,
              ),
              WisataCard(
                nama: 'Balekambang',
                alamat: 'Solo',
                imageUrl: 'assets/balekambang.png',
                rating: 4.8,
              ),
            ],
          ),
        ),
      );
    }

    Widget newWisata() {
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
            WisataTile(
              nama: 'Grojogan Sewu',
              alamat: 'Tawanmangu',
              imageUrl: 'assets/grojogansewu1.png',
              rating: 4.5,
            ),
            WisataTile(
              nama: 'Mata Air Pablengan',
              alamat: 'Matesih',
              imageUrl: 'assets/mataairpablengan1.png',
              rating: 4.7,
            ),
            WisataTile(
              nama: 'Pandawa Waterpark',
              alamat: 'Sukoharjo',
              imageUrl: 'assets/pandawawaterpark1.png',
              rating: 4.8,
            ),
            WisataTile(
              nama: 'Pabrik Gula',
              alamat: 'Colomadu',
              imageUrl: 'assets/pabrikgula.png',
              rating: 4.5,
            ),
            WisataTile(
              nama: 'Gunung Sepikul',
              alamat: 'Sukoharjo',
              imageUrl: 'assets/gunungsepikul.png',
              rating: 4.7,
            ),
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
        topDestination(),
        newWisata(),
      ],
    );
  }
}
