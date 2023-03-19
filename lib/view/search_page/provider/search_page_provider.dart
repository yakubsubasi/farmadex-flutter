import 'package:farmadex/model/disease_model/prescription_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'search_page_provider.g.dart';

// to generate the code, run the following command in the terminal
// flutter packages pub run build_runner build --delete-conflicting-outputs

@riverpod
FutureOr<List<Prescription>> getPrescriptions(GetPrescriptionsRef ref) async {
  final client = ref.watch(supabaseClientProvider);
  final response = await client.from('prescriptions').select();

  List<Prescription> prescriptions = List.from(
    response.map(
      (e) => Prescription.fromJson(e as Map<String, dynamic>),
    ),
  );

  return prescriptions;
}

@riverpod
supabaseClient(SupabaseClientRef ref) {
  return Supabase.instance.client;
}
