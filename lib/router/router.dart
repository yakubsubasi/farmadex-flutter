import 'package:farmadex/router/go_router_refresh_stream.dart';
import 'package:farmadex/view/agreement_page/agreement_page_view.dart';
import 'package:farmadex/view/authentication/data/firebase_auth_repository.dart';
import 'package:farmadex/view/authentication/presentation/custom_profile_screen.dart';
import 'package:farmadex/view/authentication/presentation/custom_sign_in_screen.dart';
import 'package:farmadex/view/feedback/ui/new_feedback/new_feedback_view.dart';
import 'package:farmadex/view/landing_page/landing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// to watch and build this file, run the following command:
// $ flutter pub run build_runner watch --delete-conflicting-outputs

part 'router.g.dart';

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
      refreshListenable:
          GoRouterRefreshStream(authRepository.authStateChanges()),
      redirect: (context, state) {
        final isLoggedIn = authRepository.currentUser != null;
        if (isLoggedIn) {
          if (state.uri.toString().startsWith('/signIn')) {
            return '/';
          }
        } else if (state.uri.toString().startsWith('/')) {
          return '/signIn';
        }
        return null;
      },
      initialLocation: '/signIn',
      routes: [
        GoRoute(
          path: '/agreement',
          name: AppRoute.agreement.name,
          pageBuilder: (context, state) => const CupertinoPage(
            child: AgreementPage(),
          ),
        ),
        GoRoute(
          path: '/',
          name: AppRoute.landingPage.name,
          pageBuilder: (contsext, state) => const CupertinoPage(
            child: LandingPage(),
          ),
        ),
        GoRoute(
          path: '/feedBack',
          name: AppRoute.feedBack.name,
          pageBuilder: (context, state) => CupertinoPage(
            child: NewFeedbackView(),
          ),
        ),
        GoRoute(
          path: '/signIn',
          name: AppRoute.signIn.name,
          pageBuilder: (context, state) => const CupertinoPage(
            child: CustomSignInScreen(),
          ),
        ),
        GoRoute(
            path: '/profile',
            name: AppRoute.profile.name,
            pageBuilder: (context, state) => const CupertinoPage(
                  child: CustomProfileScreen(),
                )),
      ]);
}

enum AppRoute {
  agreement,
  onboarding,
  signIn,
  profile,
  landingPage,
  feedBack,
}
