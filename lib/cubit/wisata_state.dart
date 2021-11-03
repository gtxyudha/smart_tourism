part of 'wisata_cubit.dart';

abstract class WisataState extends Equatable {
  const WisataState();

  @override
  List<Object> get props => [];
}

class WisataInitial extends WisataState {}

class WisataLoading extends WisataState {}

class WisataSuccess extends WisataState {
  final List<WisataModel> wisata;

  WisataSuccess(this.wisata);

  @override
  List<Object> get props => [wisata];
}

class WisataFailed extends WisataState {
  final String error;

  WisataFailed(this.error);

  @override
  List<Object> get props => [error];
}
