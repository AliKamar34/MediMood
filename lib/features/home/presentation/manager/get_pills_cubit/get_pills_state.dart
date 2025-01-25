part of 'get_pills_cubit.dart';

@immutable
sealed class GetPillsState {}

final class GetPillsInitial extends GetPillsState {}

final class GetPillsLoading extends GetPillsState {}

final class GetPillsSuccess extends GetPillsState {
  final List<PillModel> pills;
  GetPillsSuccess({required this.pills});
}

final class GetPillsFailuer extends GetPillsState {
  final String message;
  GetPillsFailuer({required this.message});
}
