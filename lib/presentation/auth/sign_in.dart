import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

import '../../consts/app_bar.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Sign In'),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          SupaEmailAuth(
            authAction: SupaAuthAction.signIn,
            onSuccess: (response) {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          TextButton(
            child: const Text(
              'Forgot Password? Click here',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/forgot_password');
            },
          ),
          TextButton(
            child: const Text(
              'Don\'t have an account? Sign Up',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          const Divider(),
          SupaSocialsAuth(
            colored: true,
            socialProviders: const [
              SocialProviders.google,
            ],
            onSuccess: (session) {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
        ],
      ),
    );
  }
}
