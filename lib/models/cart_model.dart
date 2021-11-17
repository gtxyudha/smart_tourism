class CartDataModel {
  String? deskripsi;
  String? imageUrl;
  String? namaproduk;
  String? penjual;
  double? harga;
  String? userid;
  String? produkid;
  int? counter;
  CartDataModel(
    this.deskripsi,
    this.imageUrl,
    this.namaproduk,
    this.penjual,
    this.harga,
    this.userid,
    this.produkid,
    this.counter,
  );

  CartDataModel.fromJson(Map<String, dynamic> json) {
    deskripsi = json['deskripsi'];
    imageUrl = json['imageUrl'];
    namaproduk = json['namaproduk'];
    penjual = json['penjual'];
    harga = json['harga'];
    userid = json['userid'];
    produkid = json['produkid'];
    counter = json['counter'];
  }

  Map<String, dynamic> toMap() {
    return {
      'deskripsi': deskripsi,
      'imageUrl': imageUrl,
      'namaproduk': namaproduk,
      'penjual': penjual,
      'harga': harga,
      'userid': userid,
      'produkid': produkid,
      'counter': counter,
    };
  }
}
