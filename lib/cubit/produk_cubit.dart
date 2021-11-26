import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_tourism/models/cart_model.dart';
import 'package:smart_tourism/models/produk_model.dart';
import 'package:smart_tourism/models/user_model.dart';
import 'package:smart_tourism/services/produk_services.dart';

part 'produk_state.dart';

class ProdukCubit extends Cubit<ProdukState> {
  ProdukCubit() : super(ProdukInitial());
  static ProdukCubit get(context) => BlocProvider.of(context);

  void fecthProduk() async {
    try {
      emit(ProdukLoading());
      List<ProdukModel> produk = await ProdukService().fetchProduk();

      emit(ProdukSuccess(produk));
    } catch (e) {
      emit(ProdukFailed(e.toString()));
    }
  }

  UserModel? user;

  void addToCart({
    required String deskripsi,
    required String imageUrl,
    required String namaproduk,
    required String penjual,
    required double harga,
    required String produkid,
    required String produkuserid,
    String? userid,
    int? counter,
  }) {
    CartDataModel cartDataModel = CartDataModel(
      deskripsi,
      imageUrl,
      namaproduk,
      penjual,
      harga,
      userid = FirebaseAuth.instance.currentUser!.uid,
      produkid,
      counter = 1,
    );

    FirebaseFirestore.instance
        .collection('cart')
        .doc('${FirebaseAuth.instance.currentUser!.email}$produkuserid')
        .set(cartDataModel.toMap())
        .then((value) {
      emit(AppAddToCartSuccessState());
    }).catchError((error) {
      emit(AppAddToCartErrorState(error.toString()));
    });
  }

  List<CartDataModel> cart = [];
  void getCartItems() {
    FirebaseFirestore.instance
        .collection('cart')
        .where("userid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      cart = [];
      event.docs.forEach((element) {
        cart.add(CartDataModel.fromJson(element.data()));
      });
      emit(AppGetCartDataSuccessState());
    });
  }

  void removeFromCart({
    required String userEmail,
    required String userId,
  }) {
    FirebaseFirestore.instance
        .collection('cart')
        .doc('$userEmail$userId')
        .delete()
        .then((value) {
      emit(AppRemoveFromCartSuccessState());
    }).catchError((error) {
      emit(AppRemoveFromCartErrorState(error.toString()));
    });
  }

  UserModel? userModel;

  void getUserData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((event) {
      userModel = UserModel.fromJson(
          FirebaseAuth.instance.currentUser!.uid, event.data()!);
      emit(AppGetUserDataSuccessState());
    });
  }

  void updateUserCartTotal({
    required int total,
  }) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({'cartTotal': total}).then((value) {
      emit(AppUpdateUserCartTotalSuccessState());
    }).catchError((error) {
      emit(AppUpdateUserCartTotalErrorState(error.toString()));
    });
  }

  void updateUserCartCounter({
    required String produkid,
    required int counter,
  }) {
    FirebaseFirestore.instance
        .collection('cart')
        .doc('${FirebaseAuth.instance.currentUser!.email}$produkid')
        .update({'counter': counter}).then((value) {
      emit(AppUpdateUserCartCounterSuccessState());
    }).catchError((error) {
      emit(AppUpdateUserCartCounterErrorState(error.toString()));
    });
  }
}
