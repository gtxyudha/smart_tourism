import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tourism/models/wisata_baru_model.dart';

class WisataBaruService {
  CollectionReference _wisatabaruRef =
      FirebaseFirestore.instance.collection('wisatabaru');

  Future<List<WisataBaruModel>> fetchWisatabaru() async {
    try {
      QuerySnapshot result = await _wisatabaruRef.get();

      List<WisataBaruModel> wisatabaru = result.docs.map((e) {
        return WisataBaruModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return wisatabaru;
    } catch (e) {
      throw e;
    }
  }
}
