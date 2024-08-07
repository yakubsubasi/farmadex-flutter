// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      userType: $enumDecodeNullable(_$UserTypeEnumMap, json['user_type']),
      isPremium: json['is_premium'] as bool?,
      isOnboarded: json['is_onboarded'] as bool?,
      classGrade: (json['class_grade'] as num?)?.toInt(),
      registerDate: json['register_date'] == null
          ? null
          : DateTime.parse(json['register_date'] as String),
      speciality: $enumDecodeNullable(_$SpecialityEnumMap, json['speciality']),
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'user_type': _$UserTypeEnumMap[instance.userType],
      'is_premium': instance.isPremium,
      'is_onboarded': instance.isOnboarded,
      'class_grade': instance.classGrade,
      'register_date': instance.registerDate?.toIso8601String(),
      'speciality': _$SpecialityEnumMap[instance.speciality],
    };

const _$UserTypeEnumMap = {
  UserType.practitioner: 'practitioner',
  UserType.specialist: 'specialist',
  UserType.student: 'student',
  UserType.other: 'other',
};

const _$SpecialityEnumMap = {
  Speciality.internalMedicine: 'internalMedicine',
  Speciality.pediatric: 'pediatric',
  Speciality.orthopedic: 'orthopedic',
  Speciality.cardiology: 'cardiology',
  Speciality.neurology: 'neurology',
  Speciality.oncology: 'oncology',
  Speciality.psychiatry: 'psychiatry',
  Speciality.generalSurgery: 'generalSurgery',
  Speciality.gynecology: 'gynecology',
  Speciality.urology: 'urology',
  Speciality.emergency: 'emergency',
  Speciality.ent: 'ent',
  Speciality.dental: 'dental',
  Speciality.ophtalmology: 'ophtalmology',
  Speciality.dermatology: 'dermatology',
  Speciality.pulmonaryDisease: 'pulmonaryDisease',
  Speciality.familyMedicine: 'familyMedicine',
};
