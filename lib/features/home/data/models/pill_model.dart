import 'package:hive/hive.dart';

part 'pill_model.g.dart';

@HiveType(typeId: 2)
class PillModel extends HiveObject {
  @HiveField(1)
  final String pillName;
  @HiveField(2)
  final String noOfPills;
  @HiveField(3)
  final String beforeAndAfter;
  @HiveField(4)
  final String time;
  @HiveField(5)
  final String period;
  @HiveField(6)
  bool isTaken;
  @HiveField(7)
  DateTime? lastTakenTime;
  @HiveField(8)
  final int? pillId;

  PillModel({
    required this.pillName,
    required this.noOfPills,
    required this.beforeAndAfter,
    required this.time,
    required this.period,
    required this.pillId,
    this.isTaken = false,
    this.lastTakenTime,
  });
}
