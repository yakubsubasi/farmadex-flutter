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
String _$searchDiseasesHash() => r'f91cd0a9a66a6bef63e8620ab5b18f0b75b45e11';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef SearchDiseasesRef = AutoDisposeFutureProviderRef<List<Disease>>;

/// See also [searchDiseases].
@ProviderFor(searchDiseases)
const searchDiseasesProvider = SearchDiseasesFamily();

/// See also [searchDiseases].
class SearchDiseasesFamily extends Family<AsyncValue<List<Disease>>> {
  /// See also [searchDiseases].
  const SearchDiseasesFamily();

  /// See also [searchDiseases].
  SearchDiseasesProvider call(
    String input,
  ) {
    return SearchDiseasesProvider(
      input,
    );
  }

  @override
  SearchDiseasesProvider getProviderOverride(
    covariant SearchDiseasesProvider provider,
  ) {
    return call(
      provider.input,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchDiseasesProvider';
}

/// See also [searchDiseases].
class SearchDiseasesProvider extends AutoDisposeFutureProvider<List<Disease>> {
  /// See also [searchDiseases].
  SearchDiseasesProvider(
    this.input,
  ) : super.internal(
          (ref) => searchDiseases(
            ref,
            input,
          ),
          from: searchDiseasesProvider,
          name: r'searchDiseasesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchDiseasesHash,
          dependencies: SearchDiseasesFamily._dependencies,
          allTransitiveDependencies:
              SearchDiseasesFamily._allTransitiveDependencies,
        );

  final String input;

  @override
  bool operator ==(Object other) {
    return other is SearchDiseasesProvider && other.input == input;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, input.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
