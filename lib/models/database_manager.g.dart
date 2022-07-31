// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_manager.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaveUserDataAdapter extends TypeAdapter<SaveUserData> {
  @override
  final int typeId = 0;

  @override
  SaveUserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaveUserData()
      ..title = fields[0] as String
      ..username = fields[1] as String
      ..password = fields[2] as String
      ..email = fields[3] as String;
  }

  @override
  void write(BinaryWriter writer, SaveUserData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveUserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
