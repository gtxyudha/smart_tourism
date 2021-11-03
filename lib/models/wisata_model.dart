import 'package:equatable/equatable.dart';

class WisataModel extends Equatable {
  final String id;
  final String nama;
  final String alamat;
  final String imageUrl;
  final double rating;

  WisataModel({
    required this.id,
    this.nama = '',
    this.alamat = '',
    this.imageUrl = '',
    this.rating = 0.0,
  });

  factory WisataModel.fromJson(String id, Map<String, dynamic> json) =>
      WisataModel(
        id: id,
        nama: json['nama'],
        alamat: json['alamat'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
      );

  @override
  List<Object?> get props => [id, nama, alamat, imageUrl, rating];
}
