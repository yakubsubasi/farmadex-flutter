import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static Future<String> fetchConst(String name, SupabaseClient client) async {
    final response = await client.from('consts').select().eq('name', name);
    return response?[0]['value'] as String;
  }
}
