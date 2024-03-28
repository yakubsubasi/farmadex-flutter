import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:farmadex/view/onboarding/providers/app_user_provider/app_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const CustomDrawerHeader(),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  title: const Text('Profil'),
                  onTap: () {
                    // Navigate to profile page
                    context.push('/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Kullanıcı Sözleşmesi'),
                  onTap: () {
                    // Navigate to agreement page
                    context.push('/agreement');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text('Bize Ulaşın'),
                  onTap: () {
                    context.push('/feedBack');
                  },
                ),
              ],
            ),
          ),
          SafeArea(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final auth = ref.watch(authRepositoryProvider);
                return ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Çıkış Yap'),
                  onTap: () async {
                    await auth.signOut();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDrawerHeader extends ConsumerWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoURL = ref.watch(firebaseAuthProvider).currentUser?.photoURL;

    final name = ref.watch(firebaseAuthProvider).currentUser?.displayName;
    final email = ref.watch(appUserRepositoryProvider).asData?.value?.email;

    return DrawerHeader(
      child: Column(
        children: [
          const Text('Menu'),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              //Navigate to profile page
              context.push('/profile');
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage:
                      photoURL != null ? NetworkImage(photoURL) : null,
                  child: photoURL == null
                      ? const Icon(Icons.account_circle, size: 60)
                      : null,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      email ?? '',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
