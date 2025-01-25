import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo.dart';

part 'add_pill_state.dart';

class AddPillCubit extends Cubit<AddPillState> {
  AddPillCubit(this.homeRepo) : super(AddPillInitial());
  final HomeRepo homeRepo;
  addPill(PillModel pill) async {
    emit(AddPillLoading());
    try {
      await homeRepo.addPill(pill);
      emit(AddPillSuccess());
    } catch (e) {
      emit(AddPillFailuer(errMessage: e.toString()));
    }
  }
}
