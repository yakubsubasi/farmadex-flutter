// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      id: json['id'] as String?,
      name: json['name'] as String?,
      activeSubstance: json['activeSubstance'] as String?,
      howOften: json['howOften'] as String?,
      howMany: json['howMany'] as String?,
      units: json['units'] as String?,
      howToUse: json['howToUse'] as String?,
      periode: json['periode'] as String?,
      numberOfBoxes: json['numberOfBoxes'] as int?,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'activeSubstance': instance.activeSubstance,
      'howOften': instance.howOften,
      'howMany': instance.howMany,
      'units': instance.units,
      'howToUse': instance.howToUse,
      'periode': instance.periode,
      'numberOfBoxes': instance.numberOfBoxes,
    };
