part of 'produk_cubit.dart';

abstract class ProdukState extends Equatable {
  const ProdukState();

  @override
  List<Object> get props => [];
}

class ProdukInitial extends ProdukState {}

class ProdukLoading extends ProdukState {}

class ProdukSuccess extends ProdukState {
  final List<ProdukModel> produk;

  ProdukSuccess(this.produk);

  @override
  List<Object> get props => [produk];
}

class ProdukFailed extends ProdukState {
  final String error;

  ProdukFailed(this.error);

  @override
  List<Object> get props => [error];
}
