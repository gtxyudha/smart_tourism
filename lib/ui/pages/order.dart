import 'package:flutter/material.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/cardlist.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 29, right: 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('My Shopping Cart',
                  style: putihTextStyle.copyWith(
                    fontSize: 22,
                    fontWeight: bold,
                  )),
            ),
            SizedBox(height: 30),
            Cardlist(
              'assets/serabi_notosuman.jpeg',
              'assets/min_icon.png',
              '1',
              'assets/plus_icon.png',
              'Serabi Notosuman',
              'Ny. Lidya',
              'Rp. 26.000',
            ),
            SizedBox(height: 26),
            Container(
              width: 400,
              height: 161,
              decoration: BoxDecoration(
                color: kputihColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informations Pays',
                      style: hitamTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sub Total',
                              style: hitamTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Delivery',
                                style: hitamTextStyle.copyWith(
                                  fontSize: 16,
                                )),
                            SizedBox(height: 10),
                            Text('Total',
                                style: hitamTextStyle.copyWith(
                                  fontSize: 16,
                                )),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Rp. 26.000',
                              style: hitamTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: medium,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text('Rp. 10.000',
                                style: hitamTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                )),
                            SizedBox(height: 10),
                            Text('Rp. 36.000',
                                style: hitamTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semibold,
                                )),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ThemeButton(
                title: 'Check Out',
                width: 286,
                margin: EdgeInsets.only(top: 30),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
