// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_movie_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyMovieEntityAdapter extends TypeAdapter<MyMovieEntity> {
  @override
  final int typeId = 1;

  @override
  MyMovieEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyMovieEntity(
      watchDate: fields[0] as DateTime?,
      title: fields[1] as String?,
      withWatchPerson: (fields[4] as List?)?.cast<String>(),
      movieEntity: fields[3] as MovieEntity?,
    )..impression = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, MyMovieEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.watchDate)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.impression)
      ..writeByte(3)
      ..write(obj.movieEntity)
      ..writeByte(4)
      ..write(obj.withWatchPerson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyMovieEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
