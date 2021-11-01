import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_tourism/models/user_model.dart';

class UserServices {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.iduser).set({
        'email': user.email,
        'username': user.username,
        'alamat': user.alamat,
        'notelp': user.notelp,
      });
    } catch (e) {
      throw e;
    }
  }
}
