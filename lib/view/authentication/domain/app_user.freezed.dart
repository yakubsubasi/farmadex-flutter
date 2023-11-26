// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  String? get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  UserType? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_premium')
  bool? get isPremium => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_onboarded')
  bool? get isOnboarded => throw _privateConstructorUsedError;
  @JsonKey(name: 'class_grade')
  int? get classGrade => throw _privateConstructorUsedError;
  @JsonKey(name: 'register_date')
  DateTime? get registerDate => throw _privateConstructorUsedError;
  Speciality? get speciality => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String? name,
      @JsonKey(name: 'user_type') UserType? userType,
      @JsonKey(name: 'is_premium') bool? isPremium,
      @JsonKey(name: 'is_onboarded') bool? isOnboarded,
      @JsonKey(name: 'class_grade') int? classGrade,
      @JsonKey(name: 'register_date') DateTime? registerDate,
      Speciality? speciality});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? userType = freezed,
    Object? isPremium = freezed,
    Object? isOnboarded = freezed,
    Object? classGrade = freezed,
    Object? registerDate = freezed,
    Object? speciality = freezed,
  }) {
    return _then(_value.copyWith(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType?,
      isPremium: freezed == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnboarded: freezed == isOnboarded
          ? _value.isOnboarded
          : isOnboarded // ignore: cast_nullable_to_non_nullable
              as bool?,
      classGrade: freezed == classGrade
          ? _value.classGrade
          : classGrade // ignore: cast_nullable_to_non_nullable
              as int?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      speciality: freezed == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as Speciality?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? uid,
      String? email,
      String? name,
      @JsonKey(name: 'user_type') UserType? userType,
      @JsonKey(name: 'is_premium') bool? isPremium,
      @JsonKey(name: 'is_onboarded') bool? isOnboarded,
      @JsonKey(name: 'class_grade') int? classGrade,
      @JsonKey(name: 'register_date') DateTime? registerDate,
      Speciality? speciality});
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = freezed,
    Object? email = freezed,
    Object? name = freezed,
    Object? userType = freezed,
    Object? isPremium = freezed,
    Object? isOnboarded = freezed,
    Object? classGrade = freezed,
    Object? registerDate = freezed,
    Object? speciality = freezed,
  }) {
    return _then(_$AppUserImpl(
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as UserType?,
      isPremium: freezed == isPremium
          ? _value.isPremium
          : isPremium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnboarded: freezed == isOnboarded
          ? _value.isOnboarded
          : isOnboarded // ignore: cast_nullable_to_non_nullable
              as bool?,
      classGrade: freezed == classGrade
          ? _value.classGrade
          : classGrade // ignore: cast_nullable_to_non_nullable
              as int?,
      registerDate: freezed == registerDate
          ? _value.registerDate
          : registerDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      speciality: freezed == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as Speciality?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl implements _AppUser {
  const _$AppUserImpl(
      {this.uid,
      this.email,
      this.name,
      @JsonKey(name: 'user_type') this.userType,
      @JsonKey(name: 'is_premium') this.isPremium,
      @JsonKey(name: 'is_onboarded') this.isOnboarded,
      @JsonKey(name: 'class_grade') this.classGrade,
      @JsonKey(name: 'register_date') this.registerDate,
      this.speciality});

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final String? uid;
  @override
  final String? email;
  @override
  final String? name;
  @override
  @JsonKey(name: 'user_type')
  final UserType? userType;
  @override
  @JsonKey(name: 'is_premium')
  final bool? isPremium;
  @override
  @JsonKey(name: 'is_onboarded')
  final bool? isOnboarded;
  @override
  @JsonKey(name: 'class_grade')
  final int? classGrade;
  @override
  @JsonKey(name: 'register_date')
  final DateTime? registerDate;
  @override
  final Speciality? speciality;

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, name: $name, userType: $userType, isPremium: $isPremium, isOnboarded: $isOnboarded, classGrade: $classGrade, registerDate: $registerDate, speciality: $speciality)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isPremium, isPremium) ||
                other.isPremium == isPremium) &&
            (identical(other.isOnboarded, isOnboarded) ||
                other.isOnboarded == isOnboarded) &&
            (identical(other.classGrade, classGrade) ||
                other.classGrade == classGrade) &&
            (identical(other.registerDate, registerDate) ||
                other.registerDate == registerDate) &&
            (identical(other.speciality, speciality) ||
                other.speciality == speciality));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, email, name, userType,
      isPremium, isOnboarded, classGrade, registerDate, speciality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser implements AppUser {
  const factory _AppUser(
      {final String? uid,
      final String? email,
      final String? name,
      @JsonKey(name: 'user_type') final UserType? userType,
      @JsonKey(name: 'is_premium') final bool? isPremium,
      @JsonKey(name: 'is_onboarded') final bool? isOnboarded,
      @JsonKey(name: 'class_grade') final int? classGrade,
      @JsonKey(name: 'register_date') final DateTime? registerDate,
      final Speciality? speciality}) = _$AppUserImpl;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  String? get uid;
  @override
  String? get email;
  @override
  String? get name;
  @override
  @JsonKey(name: 'user_type')
  UserType? get userType;
  @override
  @JsonKey(name: 'is_premium')
  bool? get isPremium;
  @override
  @JsonKey(name: 'is_onboarded')
  bool? get isOnboarded;
  @override
  @JsonKey(name: 'class_grade')
  int? get classGrade;
  @override
  @JsonKey(name: 'register_date')
  DateTime? get registerDate;
  @override
  Speciality? get speciality;
  @override
  @JsonKey(ignore: true)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
