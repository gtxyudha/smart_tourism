import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/cubit/produk_cubit.dart';
import 'package:smart_tourism/models/produk_model.dart';
import 'package:smart_tourism/shared/theme.dart';
import 'package:smart_tourism/ui/widgets/produktile.dart';

class Produk extends StatefulWidget {
  const Produk({Key? key}) : super(key: key);

  @override
  _ProdukState createState() => _ProdukState();
}

class _ProdukState extends State<Produk> {
  @override
  void initState() {
    context.read<ProdukCubit>().fecthProduk();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget newProduk(List<ProdukModel> produk) {
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
              'All',
              style: putihTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
            Column(
              children: produk.map((ProdukModel produk) {
                return ProdukTile(produk);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<ProdukCubit, ProdukState>(
      listener: (context, state) {
        if (state is ProdukFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProdukSuccess) {
          return ListView(
            children: [
              newProduk(state.produk),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
