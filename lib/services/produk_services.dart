import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tourism/models/produk_model.dart';

class ProdukService {
  CollectionReference _produkRef =
      FirebaseFirestore.instance.collection('produk');

  Future<List<ProdukModel>> fetchProduk() async {
    try {
      QuerySnapshot result = await _produkRef.get();

      List<ProdukModel> produk = result.docs.map((e) {
        return ProdukModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return produk;
    } catch (e) {
      throw e;
    }
  }
}
