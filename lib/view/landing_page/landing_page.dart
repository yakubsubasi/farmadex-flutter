import 'package:farmadex/core/consts/app_consts.dart';
import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:farmadex/view/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../disease_search/search_page_view.dart';
import '../onboarding/providers/app_user_provider/app_user_provider.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardCheck = ref.watch(appUserRepositoryProvider);

    return onboardCheck.when(
      data: (user) {
        if (user != null) {
          return const MainPage();
        } else {
          return const OnboardPage();
        }
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => const Center(
        child: Text('Error'),
      ),
    );

    // return FutureBuilder(
    //     future: isOnboarded,
    //     builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
    //       if (snapshot.hasData) {
    //         if (snapshot.data!) {
    //           return const MainPage();
    //         } else {
    //           return const OnboardPage();
    //         }
    //       } else {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //     });
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppConsts.appName,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                    '${AppConsts.appName}, yüzlerce birinci basamak için taslak reçete şablonu ile karar destek mekanizması sağlar, tedaviler hakkında faydalı bilgiler ile karar destek sürecinizi kolaylaştırır.',
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Image.asset(
                    'assets/images/landing_page_image.png',
                    width: 350,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrescsPageGate())),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Başla'),
                        SizedBox(width: 10, height: 40),
                        Icon(Icons.arrow_forward)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.assignment),
                  title: const Text('Kullanıcı Sözleşmesi'),
                  onTap: () {
                    // Navigate to agreement page
                    Navigator.pushNamed(context, '/agreement');
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: const Text('Bize Ulaşın'),
                  onTap: () {
                    Navigator.pushNamed(context, '/feedBack');
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
