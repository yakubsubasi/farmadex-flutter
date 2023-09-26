import 'package:farmadex/core/supabase_client/supabase_client_provider.dart';
import 'package:farmadex/view/agreement_page/agreement_page_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_back_page_provider.g.dart';

@riverpod
Future<String> fetchEmail(FetchEmailRef ref) async {
  final client = ref.watch(supabaseClientProvider);

  return await SupabaseService.fetchConst('contact_email', client);
}
