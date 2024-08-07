import 'package:farmadex/core/consts/app_consts.dart';
import 'package:farmadex/core/consts/auth_local.dart';
import 'package:farmadex/view/authentication/presentation/auth_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:farmadex/core/consts/supabase_key.dart';
import 'package:farmadex/firebase_options.dart';
import 'package:farmadex/router/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SupabaseConsts.SUPABASE_URL,
    anonKey: SupabaseConsts.ANON_KEY,
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseUIAuth.configureProviders([
    // EmailAuthProvider(),
    // AppleProvider(),
    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
  ]);

  await Hive.initFlutter();
  await Hive.openBox<String>('searchHistory');

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),
        FirebaseUILocalizations.delegate,
      ],
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: AppConsts.appName,
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
