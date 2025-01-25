part of 'add_pill_cubit.dart';

@immutable
sealed class AddPillState {}

final class AddPillInitial extends AddPillState {}

final class AddPillLoading extends AddPillState {}

final class AddPillSuccess extends AddPillState {}

final class AddPillFailuer extends AddPillState {
  final String errMessage;

  AddPillFailuer({required this.errMessage});
}
