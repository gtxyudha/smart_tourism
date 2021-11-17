import 'package:flutter/material.dart';
import 'package:smart_tourism/models/produk_model.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/pages/detailproduk.dart';

class ProdukTile extends StatelessWidget {
  final ProdukModel produk;

  const ProdukTile(
    this.produk, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProduk(
              produk,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 16),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kputihColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    produk.imageUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    produk.nama,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    produk.penjual,
                    style: abuTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
