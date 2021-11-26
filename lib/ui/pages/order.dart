import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/produk_cubit.dart';
import 'package:smart_tourism/models/cart_model.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/cartproductitem.dart';
import 'package:smart_tourism/ui/widgets/themebutton.dart';

// ignore: must_be_immutable
class Order extends StatelessWidget {
  CartDataModel? cart;
  Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProdukCubit.get(context).getCartItems();
    return BlocBuilder<ProdukCubit, ProdukState>(
      builder: (context, state) {
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
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return CartProductItem(
                          ProdukCubit.get(context).cart[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10.0);
                    },
                    itemCount: ProdukCubit.get(context).cart.length,
                  ),
                ),
                SizedBox(height: 26),
                Container(
                  width: 400,
                  height: 100,
                  decoration: BoxDecoration(
                    color: kputihColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 16, right: 16),
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
                                  'Total',
                                  style: hitamTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Rp. ',
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
      },
    );
  }
}
