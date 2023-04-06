// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDiseasesHash() => r'bf4027eb272248fb5eab65fb9cfd5a66bec10103';

/// See also [getDiseases].
@ProviderFor(getDiseases)
final getDiseasesProvider = AutoDisposeFutureProvider<List<Disease>>.internal(
  getDiseases,
  name: r'getDiseasesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDiseasesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDiseasesRef = AutoDisposeFutureProviderRef<List<Disease>>;
String _$supabaseClientHash() => r'36e9cae00709545a85bfe4a5a2cb98d8686a01ea';

/// See also [supabaseClient].
@ProviderFor(supabaseClient)
final supabaseClientProvider = AutoDisposeProvider<SupabaseClient>.internal(
  supabaseClient,
  name: r'supabaseClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$supabaseClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SupabaseClientRef = AutoDisposeProviderRef<SupabaseClient>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
