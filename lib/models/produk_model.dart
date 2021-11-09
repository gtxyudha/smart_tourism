import 'package:equatable/equatable.dart';

class ProdukModel extends Equatable {
  final String id;
  final String nama;
  final String penjual;
  final String imageUrl;
  final String deskripsi;
  final double harga;

  ProdukModel({
    required this.id,
    this.nama = '',
    this.penjual = '',
    this.imageUrl = '',
    this.deskripsi = '',
    this.harga = 0.0,
  });

  factory ProdukModel.fromJson(String id, Map<String, dynamic> json) =>
      ProdukModel(
        id: id,
        nama: json['nama'],
        penjual: json['penjual'],
        imageUrl: json['imageUrl'],
        harga: json['harga'].toDouble(),
        deskripsi: json['deskripsi'],
      );

  @override
  List<Object?> get props => [id, nama, penjual, imageUrl, deskripsi, harga];
}
