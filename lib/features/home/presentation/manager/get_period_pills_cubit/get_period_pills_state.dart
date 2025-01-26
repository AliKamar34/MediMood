part of 'get_period_pills_cubit.dart';

@immutable
sealed class GetPeriodPillsState {}

final class GetPeriodPillsInitial extends GetPeriodPillsState {}

final class GetPeriodPillsLoading extends GetPeriodPillsState {}

final class GetPeriodPillsFailuer extends GetPeriodPillsState {
  final String errMessage;

  GetPeriodPillsFailuer({required this.errMessage});
}

final class GetPeriodPillsBreakFast extends GetPeriodPillsState {
  final List<PillModel> breakfastPills;

  GetPeriodPillsBreakFast({required this.breakfastPills});
}

final class GetPeriodPillsLunch extends GetPeriodPillsState {
  final List<PillModel> lunchPills;

  GetPeriodPillsLunch({required this.lunchPills});
}

final class GetPeriodPillsDinner extends GetPeriodPillsState {
  final List<PillModel> dinnerPills;

  GetPeriodPillsDinner({required this.dinnerPills});
}
