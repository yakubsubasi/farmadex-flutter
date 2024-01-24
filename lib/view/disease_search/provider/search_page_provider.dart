import 'package:connectivity/connectivity.dart';
import 'package:farmadex/core/supabase_client/supabase_client_provider.dart';
import 'package:farmadex/service/connectivity_service/connectivity_service.dart';
import 'package:farmadex_models/farmadex_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_page_provider.g.dart';

// to generate the code, run the following command in the terminal
// flutter packages pub run build_runner watch --delete-conflicting-outputs

@Riverpod(keepAlive: true)
FutureOr<List<Disease>> getDiseases(GetDiseasesRef ref) async {
  final client = ref.watch(supabaseClientProvider);
  final connectivity = await ConnectivityService().checkConnectivity();

  if (connectivity == ConnectivityResult.none) {
    throw Exception('No internet connection');
  }

  final response =
      await client.from('diseases').select('*, prescriptions(*, medicines(*))');

  List<Disease> diseases = List.from(
    response.map(
      (e) => Disease.fromJson(e as Map<String, dynamic>),
    ),
  );

  return diseases;
}

@riverpod
class SearchDisease extends _$SearchDisease {
  @override
  List<Disease> build() {
    return _getDisease();
  }

  searchDisease(String query) {
    final diseases = _getDisease();
    final filteredDiseases = diseases.where((disease) {
      return disease.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();
    state = filteredDiseases;
  }

  List<Disease> _getDisease() {
    return ref.watch(getDiseasesProvider).asData!.value;
  }
}
