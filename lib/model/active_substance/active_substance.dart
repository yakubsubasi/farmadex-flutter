class ActiveSubstance {
  String? atcCode;
  String? atcName;

  ActiveSubstance({this.atcCode, this.atcName});

  factory ActiveSubstance.fromJson(Map<String, dynamic> json) {
    return ActiveSubstance(
      atcCode: json['atc_kodu'] as String?,
      atcName: json['atc_adi'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'atc_kodu': atcCode,
      'atc_adi': atcName,
    };
  }

  @override
  String toString() {
    return 'ActiveSubstance{atcCode: $atcCode, atcName: $atcName}';
  }
}
