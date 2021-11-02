import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_tourism/models/user_model.dart';
import 'package:smart_tourism/services/user_services.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel user =
          await UserServices().getUserById(userCredential.user!.uid);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String password,
    required String username,
    required String alamat,
    required String notelp,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        iduser: userCredential.user!.uid,
        email: email,
        username: username,
        alamat: alamat,
        notelp: notelp,
      );

      await UserServices().setUser(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
