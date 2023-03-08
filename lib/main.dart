import 'package:farmadex/consts/supabase_key.dart';
import 'package:farmadex/presentation/auth/forgot_password.dart';
import 'package:farmadex/presentation/auth/sign_in.dart';
import 'package:farmadex/presentation/auth/sign_up.dart';
import 'package:farmadex/presentation/auth/update_password.dart';
import 'package:farmadex/presentation/deneme.dart';
import 'package:farmadex/presentation/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConsts.SUPABASE_URL,
    anonKey: SupabaseConsts.ANON_KEY,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const DenemeScreen(),
        '/home': (context) => const HomePage(),
        '/sign_up': (context) => const SignUp(),
        '/sign_in': (context) => const SignIn(),
        '/forgot_password': (context) => const ForgotPassword(),
        '/update_password': (context) => const UpdatePassword(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
