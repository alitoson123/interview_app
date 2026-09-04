// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_setup_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InterviewSetupModelAdapter extends TypeAdapter<InterviewSetupModel> {
  @override
  final int typeId = 1;

  @override
  InterviewSetupModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InterviewSetupModel(
      id: fields[0] as String,
      track: fields[1] as String,
      technology: fields[2] as String?,
      experience: fields[3] as ExperienceLevel,
      jobDescription: fields[4] as String?,
      interviewType: fields[5] as InterviewType,
      difficulty: fields[6] as Difficulty,
    );
  }

  @override
  void write(BinaryWriter writer, InterviewSetupModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.track)
      ..writeByte(2)
      ..write(obj.technology)
      ..writeByte(3)
      ..write(obj.experience)
      ..writeByte(4)
      ..write(obj.jobDescription)
      ..writeByte(5)
      ..write(obj.interviewType)
      ..writeByte(6)
      ..write(obj.difficulty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InterviewSetupModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
