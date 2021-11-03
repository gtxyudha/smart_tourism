import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_tourism/models/wisata_model.dart';
import 'package:smart_tourism/services/wisata_services.dart';

part 'wisata_state.dart';

class WisataCubit extends Cubit<WisataState> {
  WisataCubit() : super(WisataInitial());

  void fetchWisata() async {
    try {
      emit(WisataLoading());
      List<WisataModel> wisata = await WisataService().fetchWisata();

      emit(WisataSuccess(wisata));
    } catch (e) {
      emit(WisataFailed(e.toString()));
    }
  }
}
