import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tourism/models/user_model.dart';
import 'package:smart_tourism/services/auth_services.dart';
import 'package:smart_tourism/services/user_services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthServices().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      emit(Authfailed(e.toString()));
    }
  }

  void signUp(
      {required String email,
      required String password,
      required String username,
      String alamat = '',
      String notelp = ''}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthServices().signUp(
          email: email,
          password: password,
          username: username,
          alamat: alamat,
          notelp: notelp);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(Authfailed(e.toString()));
    }
  }

  void logOut() async {
    try {
      emit(AuthLoading());
      await AuthServices().logOut();
      emit(AuthInitial());
    } catch (e) {
      emit(Authfailed(e.toString()));
    }
  }

  void getCurrentUser(String iduser) async {
    try {
      UserModel user = await UserServices().getUserById(iduser);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(Authfailed(e.toString()));
    }
  }
}
