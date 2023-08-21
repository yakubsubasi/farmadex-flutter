import 'package:farmadex/core/supabase_client/supabase_client_provider.dart';
import 'package:farmadex_models/farmadex_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'search_page_provider.g.dart';

// to generate the code, run the following command in the terminal
// flutter packages pub run build_runner build --delete-conflicting-outputs

@riverpod
FutureOr<List<Disease>> getDiseases(GetDiseasesRef ref) async {
  final client = ref.watch(supabaseClientProvider);
  final response =
      await client.from('diseases').select('*, prescriptions(*, medicines(*))');

  List<Disease> diseases = List.from(
    response.map(
      (e) => Disease.fromJson(e as Map<String, dynamic>),
    ),
  );

  return diseases;
}

// get searched diseases

@riverpod
FutureOr<List<Disease>> searchDiseases(GetDiseasesRef ref, String input) async {
  final client = ref.watch(supabaseClientProvider);
  final response = await client
      .from('diseases')
      .select('*, prescriptions(*, medicines(*))')
      .textSearch('name', input, type: TextSearchType.phrase);

  List<Disease> diseases = List.from(
    response.map(
      (e) => Disease.fromJson(e as Map<String, dynamic>),
    ),
  );

  return diseases;
}
