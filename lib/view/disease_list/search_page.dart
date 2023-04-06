import 'package:farmadex/view/disease_list/provider/search_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../disease_detail/detail_page/detail_page.dart';

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
          padding: const EdgeInsets.all(8.0),
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
                  childCount: ref.watch(getDiseasesProvider).when(
                        data: (data) => data.length,
                        loading: () => 0,
                        error: (error, stack) => 0,
                      ),
                  (context, index) {
                    final pageValue = ref.watch(getDiseasesProvider);

                    return pageValue.when(
                      data: (data) {
                        return ListTile(
                            title: Text(
                              data[index].name!,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DiseaseDetailPage(
                                            disease: data[index],
                                          )));
                            });
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
