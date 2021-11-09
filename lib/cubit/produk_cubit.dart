import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tourism/models/produk_model.dart';
import 'package:smart_tourism/services/produk_services.dart';

part 'produk_state.dart';

class ProdukCubit extends Cubit<ProdukState> {
  ProdukCubit() : super(ProdukInitial());

  void fecthProduk() async {
    try {
      emit(ProdukLoading());
      List<ProdukModel> produk = await ProdukService().fetchProduk();

      emit(ProdukSuccess(produk));
    } catch (e) {
      emit(ProdukFailed(e.toString()));
    }
  }
}
