import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String iduser;
  final String username;
  final String email;
  final String alamat;
  final String notelp;
  final String foto;

  UserModel(
      {required this.iduser,
      required this.email,
      required this.username,
      required this.alamat,
      required this.notelp,
      this.foto = ''});

  @override
  List<Object?> get props => [iduser, email, username, alamat, notelp, foto];
}
