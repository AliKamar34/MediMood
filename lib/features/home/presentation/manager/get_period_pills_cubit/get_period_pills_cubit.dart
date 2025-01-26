import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_app/features/home/data/models/pill_model.dart';
import 'package:new_app/features/home/data/repos/home_repo.dart';

part 'get_period_pills_state.dart';

class GetPeriodPillsCubit extends Cubit<GetPeriodPillsState> {
  GetPeriodPillsCubit(this.homeRepo) : super(GetPeriodPillsInitial());
  final HomeRepo homeRepo;
  getPeriodPills(String period) {
    emit(GetPeriodPillsLoading());
    final result = homeRepo.getPeriodPills(period);
    result.fold(
      (failuer) {
        emit(GetPeriodPillsFailuer(errMessage: failuer.errorMessage));
      },
      (pills) {
        if (period == 'BreakFast') {
          emit(GetPeriodPillsBreakFast(breakfastPills: pills));
        } else if (period == 'Lunch') {
          emit(GetPeriodPillsLunch(lunchPills: pills));
        } else if (period == 'Dinner') {
          emit(GetPeriodPillsDinner(dinnerPills: pills));
        }
      },
    );
  }
}
