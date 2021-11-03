import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tourism/models/wisata_baru_model.dart';
import 'package:smart_tourism/models/wisata_model.dart';

class WisataService {
  CollectionReference _wisataRef =
      FirebaseFirestore.instance.collection('wisata');

  CollectionReference _wisatabaruRef =
      FirebaseFirestore.instance.collection('wisatabaru');

  Future<List<WisataModel>> fetchWisata() async {
    try {
      QuerySnapshot result = await _wisataRef.get();

      List<WisataModel> wisata = result.docs.map((e) {
        return WisataModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();
      return wisata;
    } catch (e) {
      throw e;
    }
  }

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
