import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo.dart';

part 'get_pills_state.dart';

class GetPillsCubit extends Cubit<GetPillsState> {
  GetPillsCubit(this.homeRepo) : super(GetPillsInitial());
  final HomeRepo homeRepo;
  getPills() {
    emit(GetPillsLoading());
    var result = homeRepo.getPills();
    result.fold(
      (failuer) {
        emit(GetPillsFailuer(message: failuer.errorMessage));
      },
      (pills) {
        emit(GetPillsSuccess(pills: pills));
      },
    );
  }
}
