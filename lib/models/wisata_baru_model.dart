import 'package:equatable/equatable.dart';

class WisataBaruModel extends Equatable {
  final String id;
  final String nama;
  final String alamat;
  final String imageUrl;
  final double rating;

  WisataBaruModel({
    required this.id,
    this.nama = '',
    this.alamat = '',
    this.imageUrl = '',
    this.rating = 0.0,
  });

  factory WisataBaruModel.fromJson(String id, Map<String, dynamic> json) =>
      WisataBaruModel(
        id: id,
        nama: json['nama'],
        alamat: json['alamat'],
        imageUrl: json['imageUrl'],
        rating: json['rating'].toDouble(),
      );

  @override
  List<Object?> get props => [id, nama, alamat, imageUrl, rating];
}
