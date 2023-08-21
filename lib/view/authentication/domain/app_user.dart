// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:farmadex_models/farmadex_models.dart';

// to gen flutter pub run build_runner build --delete-conflicting-outputs
// to gen flutter pub run build_runner watch --delete-conflicting-outputs

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../onboarding/model/onboarding_model.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    String? uid,
    String? email,
    String? name,
    @JsonKey(name: 'user_type') UserType? userType,
    @JsonKey(name: 'is_premium') bool? isPremium,
    @JsonKey(name: 'is_onboarded') bool? isOnboarded,
    @JsonKey(name: 'class_grade') int? classGrade,
    @JsonKey(name: 'register_date') DateTime? registerDate,
    Speciality? speciality,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
