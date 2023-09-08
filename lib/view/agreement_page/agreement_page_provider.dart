import 'package:farmadex/core/supabase_client/supabase_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'agreement_page_provider.g.dart';

@riverpod
Future<String> fetchAgreement(FetchAgreementRef ref) async {
  final supabaseClient = ref.watch(supabaseClientProvider);

  final response =
      await supabaseClient.from('consts').select().eq('name', 'agreement_text');

  return response![0]['value'] as String;
}
