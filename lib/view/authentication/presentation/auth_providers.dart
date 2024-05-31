// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, AuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
List<AuthProvider<AuthListener, AuthCredential>> authProviders(
    AuthProvidersRef ref) {
  return [
    EmailAuthProvider(),
    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
  ];
}

String get GOOGLE_CLIENT_ID {
  if (defaultTargetPlatform == TargetPlatform.iOS) {
    return '717943585031-fkvjoj0ipa5347v04ogljuaralmou90r.apps.googleusercontent.com';
  } else if (defaultTargetPlatform == TargetPlatform.android)
    return '717943585031-6eg5tg6eg164kkbkfocrel18h9b8os51.apps.googleusercontent.com';
  else
    throw UnsupportedError('Unsupported platform');
}
