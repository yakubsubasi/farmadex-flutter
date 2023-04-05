// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      id: json['id'] as int?,
      name: json['name'] as String?,
      activeSubstance: json['active_substance'] as String?,
      howOften: (json['how_often'] as num?)?.toDouble(),
      howMany: (json['how_many'] as num?)?.toDouble(),
      howToUse: json['how_to_use'] as String?,
      periode: json['periode'] as String?,
      numberOfBoxes: json['number_of_boxes'] as int?,
      barkod: json['barkod'] as int?,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active_substance': instance.activeSubstance,
      'how_often': instance.howOften,
      'how_many': instance.howMany,
      'how_to_use': instance.howToUse,
      'periode': instance.periode,
      'barkod': instance.barkod,
      'number_of_boxes': instance.numberOfBoxes,
    };
