// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Drug_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      barkod: json['barkod'] as String?,
      atcKodu: json['atc_kodu'] as String?,
      atcAdi: json['atc_adi'] as String?,
      ilacAdi: json['ilac_adi'] as String?,
      firmaAdi: json['firma_adi'] as String?,
      fiyat: json['fiyat'] as String?,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'barkod': instance.barkod,
      'atc_kodu': instance.atcKodu,
      'atc_adi': instance.atcAdi,
      'ilac_adi': instance.ilacAdi,
      'firma_adi': instance.firmaAdi,
      'fiyat': instance.fiyat,
    };
