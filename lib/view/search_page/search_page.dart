// make a search page
// search bar will make a query to the database
// search query would make to this url http://localhost:8080/drugs/searchSubstance?search=
// and show the result in a list view

import 'package:farmadex/model/active_substance/active_substance.dart';
import 'package:farmadex/service/http_service.dart';
import 'package:farmadex/view/search_page/provider/search_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/Drug/Drug_model.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Arama yapın',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: ref.watch(getPrescriptionsProvider).when(
                        data: (data) => data.length,
                        loading: () => 0,
                        error: (error, stack) => 0,
                      ),
                  (context, index) {
                    final pageValue = ref.watch(getPrescriptionsProvider);

                    return pageValue.when(
                      data: (data) {
                        return ListTile(title: Text(data[index].name!));
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stack) => Text(error.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
