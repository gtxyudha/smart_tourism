import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';

// ignore: must_be_immutable
class Cardlist extends StatelessWidget {
  String imageUrl;
  String iconmin;
  String jumlah;
  String iconplus;
  String produk;
  String penjual;
  String harga;

  Cardlist(
    this.imageUrl,
    this.iconplus,
    this.jumlah,
    this.iconmin,
    this.produk,
    this.penjual,
    this.harga,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 140,
      decoration: BoxDecoration(
        color: kputihColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10,
        ),
        child: Row(
          children: [
            Column(
              children: [
                Image.asset(
                  imageUrl,
                  width: 80,
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    Image.asset(
                      iconmin,
                      width: 22,
                    ),
                    SizedBox(width: 10),
                    Text(jumlah,
                        style: hitamTextStyle.copyWith(
                            fontWeight: medium, fontSize: 16)),
                    SizedBox(width: 10),
                    Image.asset(
                      iconplus,
                      width: 22,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk,
                    style: hitamTextStyle.copyWith(
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    penjual,
                    style: hitamTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 70,
              ),
              child: Text(
                harga,
                style: hitamTextStyle.copyWith(
                  fontWeight: semibold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
