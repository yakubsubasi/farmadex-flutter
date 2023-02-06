import 'package:json_annotation/json_annotation.dart';

part 'medicine_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Medicine {
  Medicine({
    this.id,
    this.name,
    this.activeSubstance,
    this.howOften,
    this.howMany,
    this.units,
    this.howToUse,
    this.periode,
    this.numberOfBoxes,
  });

  String? id;
  String? name;
  String? activeSubstance;
  String? howOften;
  String? howMany;
  String? units;
  String? howToUse;
  String? periode;
  int? numberOfBoxes;

  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);
  Map<String, dynamic> toJson() => _$MedicineToJson(this);
}
