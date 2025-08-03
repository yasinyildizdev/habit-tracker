// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habits_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitsHiveAdapter extends TypeAdapter<HabitsHive> {
  @override
  final int typeId = 1;

  @override
  HabitsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitsHive(
      id: fields[0] as int,
      icon: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
      category: fields[4] as String,
      start: fields[5] as int,
      end: fields[6] as int,
      time: fields[7] as String,
      reminder: fields[8] as String,
      type: fields[9] as String,
      frequency: (fields[10] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, HabitsHive obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.start)
      ..writeByte(6)
      ..write(obj.end)
      ..writeByte(7)
      ..write(obj.time)
      ..writeByte(8)
      ..write(obj.reminder)
      ..writeByte(9)
      ..write(obj.type)
      ..writeByte(10)
      ..write(obj.frequency);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
