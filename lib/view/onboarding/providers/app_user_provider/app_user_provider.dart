import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:farmadex/view/authentication/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'app_user_provider.g.dart';

@Riverpod(keepAlive: true)
class AppUserRepository extends _$AppUserRepository {
  final _firebaseFirestore = FirebaseFirestore.instance;

  @override
  FutureOr<AppUser?>? build() async {
    return _fetchUser();
  }

  /// fetch if user exists in cloud firestore database in 'users' collection
  ///
  Future<AppUser?> _fetchUser() async {
    final user = ref.watch(firebaseAuthProvider).currentUser;

    if (user != null) {
      final userDoc =
          await _firebaseFirestore.collection('users').doc(user.uid).get();

      // ignore: unnecessary_null_comparison
      if (userDoc.data() != null) {
        final appUser =
            AppUser.fromJson(userDoc.data() as Map<String, dynamic>);
        return appUser;
      }
    } else {
      return null;
    }
    return null;
  }

  Future<void> updateUser(AppUser user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .update(user.toJson());
      return user;
    });
  }

  Future<void> createUser(AppUser user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(user.toJson());
      return user;
    });
  }

  Future<void> deleteUser(AppUser user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _firebaseFirestore.collection('users').doc(user.uid).delete();
      return null;
    });
  }
}
