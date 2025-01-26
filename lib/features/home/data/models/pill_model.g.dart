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
    );
  }

  @override
  void write(BinaryWriter writer, PillModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.pillName)
      ..writeByte(2)
      ..write(obj.noOfPills)
      ..writeByte(3)
      ..write(obj.beforeAndAfter)
      ..writeByte(4)
      ..write(obj.time)
      ..writeByte(5)
      ..write(obj.period);
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
