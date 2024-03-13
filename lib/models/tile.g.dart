// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TileAdapter extends TypeAdapter<Tile> {
  @override
  final int typeId = 0;

  @override
  Tile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tile(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      from: fields[3] as String,
      to: fields[4] as String,
      dateFrom: fields[5] as String,
      dateTo: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tile obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.from)
      ..writeByte(4)
      ..write(obj.to)
      ..writeByte(5)
      ..write(obj.dateFrom)
      ..writeByte(6)
      ..write(obj.dateTo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
