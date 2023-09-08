import 'package:farmadex/view/onboarding/view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../disease_list/search_page_view.dart';
import '../onboarding/providers/app_user_provider/app_user_provider.dart';

class LandingPage extends ConsumerWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnboarded = ref.watch(appUserProviderProvider) != null;
    print(isOnboarded);

    return isOnboarded ? const MainPage() : const OnboardPage();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustonDrawer(),
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
                  'Farmadex',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                    'Farmadex, yüzlerce birinci basamak için taslak reçte şablonu ile karar destek mekanizması sağlar, tedaviler hakkında faydalı bilgiler ile karar destek sürecinizi kolaylaştırır.',
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
                            builder: (context) => const PrescsPage())),
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

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      children: [
        DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Menu',
            )),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          onTap: () {
            //Navigate to profile page
            context.go('/profile');
          },
        ),
        ListTile(
          leading: Icon(Icons.assignment),
          title: Text('Kullanıcı Sözleşmesi'),
          onTap: () {
            //Navigate to profile page
            context.push('/agreement');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {},
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text('Çıkış Yap'),
          onTap: null,
        ),
      ],
    );
  }
}
