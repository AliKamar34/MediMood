// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pill_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PillModelAdapter extends TypeAdapter<PillModel> {
  @override
  final int typeId = 2;

  @override
  PillModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PillModel(
      pillName: fields[1] as String,
      noOfPills: fields[2] as String,
      beforeAndAfter: fields[3] as String,
      time: fields[4] as String,
      period: fields[5] as String,
      isTaken: fields[6] as bool,
      lastTakenTime: fields[7] as DateTime?,
      pillId: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, PillModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.pillName)
      ..writeByte(2)
      ..write(obj.noOfPills)
      ..writeByte(3)
      ..write(obj.beforeAndAfter)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.period)
      ..writeByte(6)
      ..write(obj.isTaken)
      ..writeByte(7)
      ..write(obj.lastTakenTime)
      ..writeByte(8)
      ..write(obj.pillId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PillModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
