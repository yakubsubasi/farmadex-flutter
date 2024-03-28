// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:farmadex/view/landing_page/view/widgets/custom_drawer.dart';
import 'package:farmadex/view/landing_page/view/widgets/home_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:farmadex/core/consts/app_consts.dart';
import 'package:farmadex/view/onboarding/view/onboarding_view.dart';
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
          padding: const EdgeInsets.fromLTRB(28, 0, 28, 32),
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
                height: 16,
              ),
              Text(
                  '${AppConsts.appName}, birinci basamak hastalıklar için taslak reçeteler, tedaviler hakkında faydalı bilgiler ile karar destek sürecinizi kolaylaştırır.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Image.asset(
                  'assets/images/landing_page_image.png',
                  width: 350,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              HomePageButton(
                isActive: false,
                onTap: () {},
                icon: Icons.book,
                buttonText: 'Eğitim Programları',
              ),
              const SizedBox(
                height: 4,
              ),
              HomePageButton(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrescsPageGate()),
                ),
                icon: Icons.medical_information,
                buttonText: 'Reçete Asistanı',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
