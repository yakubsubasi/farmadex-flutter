import 'package:json_annotation/json_annotation.dart';

part 'Drug_model.g.dart';

// To build the model, run the following command in terminal: flutter pub run build_runner build

@JsonSerializable()
class Drug {
  String? barkod;
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
}
