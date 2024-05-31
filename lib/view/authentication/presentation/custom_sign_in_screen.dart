import 'package:farmadex/core/consts/app_consts.dart';
import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../agreement_page/agreement_page_view.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final authProviders = ref.watch(authProvidersProvider);
    return SignInScreen(
      headerBuilder: (context, constrains, _) {
        return const SignInHeader();
      },
      showAuthActionSwitch: true,

      // providers: authProviders,
      footerBuilder: (context, action) {
        return const RegisterScreenFooter();
      },
    );
  }
}

class SignInHeader extends StatelessWidget {
  const SignInHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          AppConsts.appName,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SvgPicture.asset(
          'assets/logo/logo.svg',
          width: 120,
        ),
      ],
    );
  }
}

class RegisterScreenFooter extends StatelessWidget {
  const RegisterScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Giriş yaparak ",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            TextSpan(
              text: "Üyelik Koşullarını",
              style: TextStyle(
                color: Colors.grey[600],
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AgreementPage()));
                },
            ),
            TextSpan(
              text: " kabul ediyorum.",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// doesn't used in this project
class SignInAnonymouslyFooter extends ConsumerWidget {
  const SignInAnonymouslyFooter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const SizedBox(width: 8.0),
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('or'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        TextButton(
          onPressed: () => ref.read(firebaseAuthProvider).signInAnonymously(),
          child: const Text('Sign in anonymously'),
        ),
      ],
    );
  }
}
