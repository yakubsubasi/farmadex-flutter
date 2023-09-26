import 'package:farmadex/core/supabase_client/supabase_client_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'agreement_page_provider.g.dart';

@riverpod
Future<String> fetchAgreement(FetchAgreementRef ref) async {
  final supabaseClient = ref.watch(supabaseClientProvider);

  return await SupabaseService.fetchConst('agreement_text', supabaseClient);
}

/// fetches asyc const data in String format from supabase
class SupabaseService {
  static Future<String> fetchConst(String name, SupabaseClient client) async {
    final response = await client.from('consts').select().eq('name', name);
    return response?[0]['value'] as String;
  }
}
