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
    const isProMember =
        false; // Replace with your logic to determine if the user is a Pro member

    return ProfileScreen(
      showDeleteConfirmationDialog: true,
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      providers: authProviders,
      children: [
        UpgradeToProSection(isProMember: isProMember),
        const SizedBox(
          height: 20,
        ),
        const AgreementButton(),
      ],
    );
  }
}

class AgreementButton extends StatelessWidget {
  const AgreementButton({Key? key}) : super(key: key);

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

class UpgradeToProSection extends StatelessWidget {
  final bool isProMember;

  const UpgradeToProSection({Key? key, required this.isProMember})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Upgrade to Pro',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isProMember)
            const Row(
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                Text(
                  'Active',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          else
            ElevatedButton(
              onPressed: () {
                // Handle upgrade to Pro logic
              },
              child: const Text(
                'Upgrade Now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
