import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_tourism/models/produk_model.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';

class DetailProduk extends StatelessWidget {
  final ProdukModel produk;

  const DetailProduk(this.produk, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(produk.imageUrl),
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
            //Note judul gambar
            Container(
              margin: EdgeInsets.only(top: 300),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
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
                  //Note Nama Produk
                  Text(
                    produk.nama,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                  //Note Nama Penjual
                  Text(
                    produk.penjual,
                    style: hitamTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                    ),
                  ),
                  SizedBox(height: 20),
                  //Note Deskripsi
                  Text(
                    'Deskripsi',
                    style: hitamTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                  Text(
                    produk.deskripsi,
                    style: hitamTextStyle.copyWith(
                      height: 2,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            // NOTE: Harga dan Cart Button
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  // NOTE: PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                            locale: 'id',
                            symbol: 'Rp. ',
                            decimalDigits: 0,
                          ).format(produk.harga),
                          style: putihTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per bungkus',
                          style: abuTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // NOTE: ADD to cart
                  ThemeButton(
                    title: 'Add to Cart',
                    onPressed: () {},
                    width: 170,
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
