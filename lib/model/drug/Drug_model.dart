// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'Drug_model.g.dart';

// To build the model, run the following command in terminal: flutter pub run build_runner build

@JsonSerializable()
class Drug {
  int? barkod;
  String? atcKodu;
  String? atcAdi;
  String? ilacAdi;
  String? firmaAdi;
  String? fiyat;

  Drug(
      {this.barkod,
      this.atcKodu,
      this.atcAdi,
      this.ilacAdi,
      this.firmaAdi,
      this.fiyat});

  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);
  Map<String, dynamic> toJson() => _$DrugToJson(this);

  @override
  String toString() {
    return 'Drug{barkod: $barkod, atcKodu: $atcKodu, atcAdi: $atcAdi, ilacAdi: $ilacAdi, firmaAdi: $firmaAdi, fiyat: $fiyat}';
  }

  Drug.fromMap(Map<String, dynamic> map) {
    barkod = map['barkod'];
    atcKodu = map['atc_kodu'];
    atcAdi = map['atc_adi'];
    ilacAdi = map['ilac_adi'];
    firmaAdi = map['firma_adi'];
    fiyat = map['fiyat'];
  }
}
