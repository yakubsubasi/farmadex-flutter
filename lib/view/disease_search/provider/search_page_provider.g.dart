// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDiseasesHash() => r'367c0369d9df4fa51db511b8b9821beb8c1aa10c';

/// See also [getDiseases].
@ProviderFor(getDiseases)
final getDiseasesProvider = FutureProvider<List<Disease>>.internal(
  getDiseases,
  name: r'getDiseasesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDiseasesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDiseasesRef = FutureProviderRef<List<Disease>>;
String _$searchDiseaseHash() => r'22e45e9941ff2161e82987c75f0ff26d18487384';

/// See also [SearchDisease].
@ProviderFor(SearchDisease)
final searchDiseaseProvider =
    AutoDisposeNotifierProvider<SearchDisease, List<Disease>>.internal(
  SearchDisease.new,
  name: r'searchDiseaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchDiseaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchDisease = AutoDisposeNotifier<List<Disease>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
