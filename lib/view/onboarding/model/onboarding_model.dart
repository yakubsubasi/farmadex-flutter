import 'package:farmadex_models/farmadex_models.dart';

class OnboardingModel {
  final UserType? userType;
  final Speciality? speciality;
  final int? classNumber;

  OnboardingModel({
    required this.userType,
    required this.speciality,
    required this.classNumber,
  });
}

enum UserType { practitioner, specialist, student, other }
