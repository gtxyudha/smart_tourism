import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_tourism/cubit/produk_cubit.dart';
import 'package:smart_tourism/models/cart_model.dart';
import 'package:smart_tourism/shared/theme.dart';

// ignore: must_be_immutable
class CartProductItem extends StatelessWidget {
  CartDataModel cart;

  CartProductItem(this.cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdukCubit, ProdukState>(
      builder: (BuildContext context, Object? state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 175.0,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          ('${cart.imageUrl}'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 13),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.amber[400],
                        child: IconButton(
                          onPressed: () {
                            ProdukCubit.get(context).updateUserCartCounter(
                              produkid: cart.produkid.toString(),
                              counter: cart.counter! - 1,
                            );
                            ProdukCubit.get(context).updateUserCartTotal(
                              total: ProdukCubit.get(context)
                                      .userModel!
                                      .cartTotal!
                                      .toInt() -
                                  cart.harga!.toInt(),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_circle_down_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(cart.counter.toString()),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.amber[400],
                        child: IconButton(
                          onPressed: () {
                            ProdukCubit.get(context).updateUserCartCounter(
                              produkid: cart.produkid.toString(),
                              counter: cart.counter! + 1,
                            );
                            ProdukCubit.get(context).updateUserCartTotal(
                              total: ProdukCubit.get(context)
                                      .userModel!
                                      .cartTotal!
                                      .toInt() +
                                  cart.harga!.toInt(),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_circle_up_outlined,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ('${cart.namaproduk}'),
                      style: hitamTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      ('${cart.penjual}'),
                      style: hitamTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                    SizedBox(width: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'Rp. ',
                          decimalDigits: 0,
                        ).format(cart.harga),
                        style: hitamTextStyle.copyWith(
                          fontWeight: semibold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160, top: 15),
                      child: InkWell(
                        onTap: () {
                          ProdukCubit.get(context).removeFromCart(
                            userEmail: FirebaseAuth.instance.currentUser!.email
                                .toString(),
                            userId: cart.produkid.toString(),
                          );
                          ProdukCubit.get(context).updateUserCartTotal(
                            total: (ProdukCubit.get(context)
                                    .userModel!
                                    .cartTotal!
                                    .toInt() -
                                (cart.counter!.toInt() * cart.harga!.toInt())),
                          );
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.restore_from_trash_outlined,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
