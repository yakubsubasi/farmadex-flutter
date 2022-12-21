// make a search page
// search bar will make a query to the database
// search query would make to this url http://localhost:8080/drugs/searchSubstance?search=
// and show the result in a list view

import 'package:farmadex/model/active_substance/active_substance.dart';
import 'package:farmadex/service/http_service.dart';
import 'package:farmadex/view/drug_list_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/Drug/Drug_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  HttpService httpService = HttpService();
  List<ActiveSubstance> drugs = [];

  @override
  void initState() {
    /*  http
        .get(Uri.parse('http://localhost:8080/drugs/searchSubstance?search=he'))
        .then((response) {
      if (response.statusCode == 200) {
        setState(() {
          drugs = (json.decode(response.body) as List)
              .map((e) => ActiveSubstance.fromJson(e))
              .toList();
        });
        print(drugs);
      }
    }); */

    httpService.getActiveSubstance().then((value) {
      setState(() {
        drugs = value;
      });
      print(drugs);
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Search Text field in the upper side of screen
        appBar: AppBar(
          title: const Text('Arama ekranı'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      searchActiveSubstance(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Arama yapın',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ListTile(
                      title: Text(drugs[index].atcName ?? ""),
                      subtitle: Text(drugs[index].atcCode ?? ""),
                      onTap: () {
                        httpService
                            .getDrugBySubstance(drugs[index].atcCode ?? "")
                            .then((value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DrugListPage(
                                drugs: value,
                              ),
                            ),
                          );
                        });
                      },
                    );
                  },
                  childCount: drugs.length,
                ),
              ),
            ],
          ),
        ));
  }

  void searchActiveSubstance(String value) {
    httpService.searchActiveSubstance(value).then((value) {
      setState(() {
        drugs = value;
      });
      print(drugs);
    });
  }
}
