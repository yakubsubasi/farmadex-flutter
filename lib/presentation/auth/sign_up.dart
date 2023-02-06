import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          SupaEmailAuth(
            authAction: SupaAuthAction.signUp,
            redirectUrl: '/home',
            onSuccess: (_) {
              Navigator.of(context).pushReplacementNamed('/sign_in');
            },
          ),
          TextButton(
            child: const Text(
              'Already have an account? Sign In',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/sign_in');
            },
          ),
          const Divider(),
          const Text(
            'Or sign up with',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
