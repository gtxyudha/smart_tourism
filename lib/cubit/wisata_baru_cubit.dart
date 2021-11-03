import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tourism/models/wisata_baru_model.dart';
import 'package:smart_tourism/services/wisata_baru_service.dart';

part 'wisata_baru_state.dart';

class WisataBaruCubit extends Cubit<WisataBaruState> {
  WisataBaruCubit() : super(WisataBaruInitial());

  void fetchWisataBaru() async {
    try {
      emit(WisataBaruLoading());
      List<WisataBaruModel> wisatabaru =
          await WisataBaruService().fetchWisatabaru();

      emit(WisataBaruSuccess(wisatabaru));
    } catch (e) {
      emit(WisataBaruFailed(e.toString()));
    }
  }
}
