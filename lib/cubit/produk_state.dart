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

class AppAddToCartSuccessState extends ProdukState {}

class AppAddToCartErrorState extends ProdukState {
  final String error;

  AppAddToCartErrorState(this.error);
}

class AppGetCartDataSuccessState extends ProdukState {}

class AppRemoveFromCartSuccessState extends ProdukState {}

class AppRemoveFromCartErrorState extends ProdukState {
  final String error;

  AppRemoveFromCartErrorState(this.error);
}

class AppUpdateUserCartTotalSuccessState extends ProdukState {}

class AppUpdateUserCartTotalErrorState extends ProdukState {
  final String error;

  AppUpdateUserCartTotalErrorState(this.error);
}

class AppGetUserDataSuccessState extends ProdukState {}

class AppUpdateUserCartCounterSuccessState extends ProdukState {}

class AppUpdateUserCartCounterErrorState extends ProdukState {
  final String error;

  AppUpdateUserCartCounterErrorState(this.error);
}
