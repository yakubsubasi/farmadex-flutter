import 'package:farmadex/view/onboarding/model/onboarding_model.dart';
import 'package:farmadex_models/farmadex_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_state_provider.g.dart';

@riverpod
class OnboardingStateProvider extends _$OnboardingStateProvider {
  @override
  OnboardingModel build() {
    return OnboardingModel(
      name: null,
      userType: null,
      speciality: null,
      classNumber: null,
    );
  }

  void changeUserType(UserType userType) {
    state = OnboardingModel(
      name: state.name,
      userType: userType,
      speciality: state.speciality,
      classNumber: state.classNumber,
    );
  }

  void changeClass(int classNumber) {
    state = OnboardingModel(
      name: state.name,
      userType: state.userType,
      speciality: state.speciality,
      classNumber: classNumber,
    );
  }

  void changeSpeciality(Speciality speciality) {
    state = OnboardingModel(
      name: state.name,
      userType: state.userType,
      speciality: speciality,
      classNumber: state.classNumber,
    );
  }

  void changeName(String name) {
    state = OnboardingModel(
      name: name,
      userType: state.userType,
      speciality: state.speciality,
      classNumber: state.classNumber,
    );
  }
}
