import 'package:farmadex/view/authentication/presentation/auth_providers.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);
    return ProfileScreen(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/');
          },
        ),
        title: const Text('Profil'),
      ),
      providers: authProviders,
      children: const [
        AgreementButton(),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

class AgreementButton extends StatelessWidget {
  const AgreementButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.push('/agreement');
      },
      child: const Text('Kullanıcı Sözleşmesi'),
    );
  }
}
