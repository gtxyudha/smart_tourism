import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/pages/detail_page.dart';

class WisataCard extends StatelessWidget {
  final String nama;
  final String alamat;
  final String imageUrl;
  final double rating;

  const WisataCard({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.imageUrl,
    this.rating = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(),
          ),
        );
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(
          left: defaultmargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kputihColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                ),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kputihColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
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
                        rating.toString(),
                        style: hitamTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: hitamTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    alamat,
                    style: abuTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}