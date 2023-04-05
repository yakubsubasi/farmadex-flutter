import 'package:json_annotation/json_annotation.dart';

part 'medicine_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Medicine {
  Medicine(
      {this.id,
      this.name,
      this.activeSubstance,
      this.howOften,
      this.howMany,
      this.howToUse,
      this.periode,
      this.numberOfBoxes,
      this.barkod});

  int? id;
  String? name;

  @JsonKey(name: 'active_substance')
  String? activeSubstance;

  @JsonKey(name: 'how_often')
  double? howOften;

  @JsonKey(name: 'how_many')
  double? howMany;

  @JsonKey(name: 'how_to_use')
  String? howToUse;

  String? periode;
  int? barkod;

  @JsonKey(name: 'number_of_boxes')
  int? numberOfBoxes;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineToJson(this);

  @override
  String toString() {
    return 'Medicine{id: $id, name: $name, activeSubstance: $activeSubstance, howOften: $howOften, howMany: $howMany, howToUse: $howToUse, periode: $periode, numberOfBoxes: $numberOfBoxes, barkod: $barkod}';
  }
}
