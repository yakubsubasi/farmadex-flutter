import 'dart:convert';

import 'package:farmadex/model/Drug/Drug_model.dart';
import 'package:farmadex/model/active_substance/active_substance.dart';

import 'package:http/http.dart' as http;

class HttpService {
  final String _baseUrl = "http://localhost:8080/drugs";

  Future<List<ActiveSubstance>> getActiveSubstance() async {
    final response = await http.get(Uri.parse("$_baseUrl/getActiveSubstance"));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<ActiveSubstance> ativeSubstances = body
          .map(
            (item) => ActiveSubstance.fromJson(item),
          )
          .toList();
      return ativeSubstances;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<ActiveSubstance>> searchActiveSubstance(String search) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/searchSubstance?search=$search"));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<ActiveSubstance> ativeSubstances = body
          .map(
            (dynamic item) => ActiveSubstance.fromJson(item),
          )
          .toList();
      return ativeSubstances;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<List<Drug>> getDrugBySubstance(String substance) async {
    final response = await http
        .get(Uri.parse("$_baseUrl/getDrugsBySubstance?atc_kodu=$substance"));
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);
      final List<Drug> drugs = body
          .map(
            (dynamic item) => Drug.fromJson(item),
          )
          .toList();
      return drugs;
    } else {
      throw "Can't get posts.";
    }
  }
}
