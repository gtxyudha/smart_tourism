import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserModel extends Equatable {
  final String iduser;
  final String username;
  final String email;
  final String alamat;
  final String notelp;
  final String foto;
  int? cartTotal;

  UserModel({
    required this.iduser,
    required this.email,
    required this.username,
    required this.alamat,
    required this.notelp,
    this.foto = '',
    this.cartTotal,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
        iduser: id,
        email: json['email'],
        alamat: json['alamat'],
        username: json['username'],
        notelp: json['notelp'],
        foto: json['foto'],
        cartTotal: json['cartTotal'],
      );

  Map<String, dynamic> toMap() {
    return {
      'iduser': iduser,
      'email': email,
      'alamat': alamat,
      'notelp': notelp,
      'foto': foto,
      'cartTotal': cartTotal,
    };
  }

  @override
  List<Object?> get props => [
        iduser,
        email,
        username,
        alamat,
        notelp,
        foto,
        cartTotal,
      ];
}
