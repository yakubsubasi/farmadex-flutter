import 'package:farmadex/view/authentication/domain/app_user.dart';
import 'package:farmadex/view/onboarding/model/onboarding_model.dart';
import 'package:farmadex/view/onboarding/providers/onboarding_state_provider/onboarding_state_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'on_submit.g.dart';

/// This code defines a function onSubmit that creates a new user and adds
/// it to a database using Supabase client.

@riverpod
Future<void> onSubmit(OnSubmitRef ref) async {
  final client = Supabase.instance.client;
  final onboardstate = ref.watch(onboardingStateProviderProvider);
  final currentUser = auth.FirebaseAuth.instance.currentUser;

  if (currentUser == null) {
    throw Future.error('Current user is null');
  }

  final user = _createUser(currentUser, onboardstate);

  /// This code updates the user state in the app.

  /// This code adds the user to the database.
  await _addUserToDb(client, user);
}

AppUser _createUser(auth.User currentUser, OnboardingModel onboardstate) {
  return AppUser(
    email: currentUser.email!,
    name: onboardstate.name,
    uid: currentUser.uid,
    isPremium: false,
    isOnboarded: true,
    classGrade: onboardstate.classNumber,
    speciality: onboardstate.speciality,
    userType: onboardstate.userType,
    registerDate: DateTime.now(),
  );
}

Future<void> _addUserToDb(SupabaseClient client, AppUser user) async {
  await client.from('users').insert(user.toJson());
}
