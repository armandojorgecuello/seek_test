// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskDTODBAdapter extends TypeAdapter<TaskDTODB> {
  @override
  final int typeId = 1;

  @override
  TaskDTODB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskDTODB(
      name: fields[0] as String,
      taskId: fields[6] as String,
      date: fields[1] as String,
      status: fields[2] as String,
      priority: fields[3] as String,
      duration: fields[4] as String,
      description: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskDTODB obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.taskId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskDTODBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
