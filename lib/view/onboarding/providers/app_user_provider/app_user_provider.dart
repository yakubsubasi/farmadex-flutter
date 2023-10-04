import 'package:farmadex/core/supabase_client/supabase_client_provider.dart';
import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:farmadex/view/authentication/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_user_provider.g.dart';

@Riverpod(keepAlive: true)
class AppUserProvider extends _$AppUserProvider {
  @override
  AppUser? build() {
    checkUser();
  }

  Future<bool> checkUser() async {
    final client = ref.watch(supabaseClientProvider);
    final fbUser = ref.watch(authRepositoryProvider).currentUser;

    try {
      AppUser? appUser = await client
          .from('users')
          .select()
          .eq('email', fbUser!.email)
          .single()
          .then((value) => AppUser.fromJson(value));

      state = appUser;
      return true;
    } catch (e) {
      state = null;
      return false;
    }
  }

  void update(AppUser user) {
    state = user;
  }
}
