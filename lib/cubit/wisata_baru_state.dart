part of 'wisata_baru_cubit.dart';

abstract class WisataBaruState extends Equatable {
  const WisataBaruState();

  @override
  List<Object> get props => [];
}

class WisataBaruInitial extends WisataBaruState {}

class WisataBaruLoading extends WisataBaruState {}

class WisataBaruSuccess extends WisataBaruState {
  final List<WisataBaruModel> wisatabaru;

  WisataBaruSuccess(this.wisatabaru);

  @override
  List<Object> get props => [wisatabaru];
}

class WisataBaruFailed extends WisataBaruState {
  final String error;

  WisataBaruFailed(this.error);

  @override
  List<Object> get props => [error];
}
