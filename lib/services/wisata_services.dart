import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tourism/models/wisata_model.dart';

class WisataService {
  CollectionReference _wisataRef =
      FirebaseFirestore.instance.collection('wisata');

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
}
