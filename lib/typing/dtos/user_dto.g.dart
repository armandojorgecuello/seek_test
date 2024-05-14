// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserStorageDBAdapter extends TypeAdapter<UserStorageDB> {
  @override
  final int typeId = 0;

  @override
  UserStorageDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserStorageDB(
      uuid: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserStorageDB obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.uuid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserStorageDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
