import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/produk_cubit.dart';
import 'package:smart_tourism/models/cart_model.dart';

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
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100.0,
                    width: 200.0,
                    child: Column(
                      children: [
                        Text(
                          '${cart.namaproduk}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 15.0),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              'Rp. ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                            Text(
                              '${cart.harga}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 100.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage('${cart.imageUrl}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber[400],
                          child: IconButton(
                            onPressed: () {
                              if (cart.counter! > 1) {
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
                              }
                            },
                            icon: const Icon(
                              Icons.arrow_circle_down,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            '${cart.counter}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
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
                    InkWell(
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
                            color: Colors.red,
                          ),
                          Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
