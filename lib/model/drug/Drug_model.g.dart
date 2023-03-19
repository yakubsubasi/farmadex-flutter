// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Drug_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      barkod: json['barkod'] as String?,
      atcKodu: json['atcKodu'] as String?,
      atcAdi: json['atcAdi'] as String?,
      ilacAdi: json['ilacAdi'] as String?,
      firmaAdi: json['firmaAdi'] as String?,
      fiyat: json['fiyat'] as String?,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'barkod': instance.barkod,
      'atcKodu': instance.atcKodu,
      'atcAdi': instance.atcAdi,
      'ilacAdi': instance.ilacAdi,
      'firmaAdi': instance.firmaAdi,
      'fiyat': instance.fiyat,
    };
