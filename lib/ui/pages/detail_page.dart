import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/availabilityitem.dart';
import 'package:smart_tourism/ui/widgets/photoitem.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/pasarklewer.png'),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        height: 214,
        width: double.infinity,
        margin: EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kputihColor.withOpacity(0),
                khitamColor.withOpacity(0.95),
              ]),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultmargin,
        ),
        child: Column(
          children: [
            // //Note Logo
            // Container(
            //   width: 108,
            //   height: 24,
            //   margin: EdgeInsets.only(
            //     top: 30,
            //     left: defaultmargin,
            //     right: defaultmargin,
            //   ),
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage(''),
            //     ),
            //   ),
            // ),

            //Note judul
            Container(
              margin: EdgeInsets.only(top: 300),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pasar Klewer',
                          style: putihTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semibold,
                          ),
                        ),
                        Text(
                          'Solo',
                          style: putihTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/star.png'),
                          ),
                        ),
                      ),
                      Text(
                        '4.8',
                        style: putihTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

            //Note Description
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: BoxDecoration(
                color: kputihColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Note About
                  Text(
                    'About',
                    style: hitamTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Dahulu kala, pada zaman pendudukan Jepang di Indonesia, kawasan Pasar Klewer merupakan tempat pemberhentian kereta api yang digunakan sebagai tempat berjualan para pedagang pribumi. Pasar Slompretan ini merupakan tempat para pedagang kecil yang menawarkan barang dagangan berupa kain batik. Mereka meletakkan kain-kain itu dipundaknya sehingga tampak menjuntai tidak beraturan atau berkleweran jika dilihat dari kejauhan.',
                    style: hitamTextStyle.copyWith(
                      height: 2,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  //NOTE PHOTOS
                  SizedBox(height: 20),
                  Text(
                    'Photos',
                    style: hitamTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      PhotoItem(imageUrl: 'assets/gambar/pasarklewer1.png'),
                      PhotoItem(imageUrl: 'assets/gambar/pasarklewer2.png'),
                      PhotoItem(imageUrl: 'assets/gambar/pasarklewer3.png'),
                    ],
                  ),

                  //Note availability
                  SizedBox(height: 20),
                  Text(
                    'Availability',
                    style: hitamTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      AvailabilityItem(
                        textavailability: 'Batik',
                      ),
                      AvailabilityItem(
                        textavailability: 'Jaket',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      AvailabilityItem(
                        textavailability: 'House Dress',
                      ),
                      AvailabilityItem(
                        textavailability: 'Various Clotes',
                      ),
                    ],
                  ),
                  ThemeButton(
                    title: 'Maps',
                    width: 286,
                    margin: EdgeInsets.only(top: 30, left: 17),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }
}
