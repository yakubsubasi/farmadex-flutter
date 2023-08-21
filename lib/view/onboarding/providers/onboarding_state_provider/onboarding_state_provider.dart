import 'package:farmadex/view/authentication/domain/app_user.dart';
import 'package:farmadex/view/onboarding/model/onboarding_model.dart';
import 'package:farmadex_models/farmadex_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'onboarding_state_provider.g.dart';

@riverpod
class OnboardingStateProvider extends _$OnboardingStateProvider {
  @override
  OnboardingModel build() {
    return OnboardingModel(
      userType: null,
      speciality: null,
      classNumber: null,
    );
  }

  void changeUserType(UserType userType) {
    state = OnboardingModel(
      userType: userType,
      speciality: state.speciality,
      classNumber: state.classNumber,
    );
  }

  void changeClass(int classNumber) {
    state = OnboardingModel(
      userType: state.userType,
      speciality: state.speciality,
      classNumber: classNumber,
    );
  }

  void changeSpeciality(Speciality speciality) {
    state = OnboardingModel(
      userType: state.userType,
      speciality: speciality,
      classNumber: state.classNumber,
    );
  }
}


// Future<void> userUploadtoSupabase(
//     UserUploadtoSupabaseRef ref, AppUser user) async {
//   final client = Supabase.instance.client;
//   final response = await client.from('users').insert([
//     {
//       'id': user.id,
//       'email': user.email,
//       'user_type': user.userType.toString(),
//       'speciality': user.speciality.toString(),
//       'class_number': user.classNumber,
//     }
//   ]);
// }
