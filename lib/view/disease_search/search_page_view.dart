import 'package:farmadex/view/disease_search/provider/search_page_provider.dart';
import 'package:farmadex/view/disease_search/widgets/speciality_card.dart';
import 'package:farmadex_models/farmadex_models.dart';
import 'package:farmadex/view/disease_detail/detail_page/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'category_detail_page.dart';

// this widget is a gate to fetch data from supabase

class PrescsPage extends ConsumerWidget {
  const PrescsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<Disease>> diseases = ref.watch(getDiseasesProvider);
    return diseases.when(
        data: (List<Disease> diseases) {
          return PrescSearchPage(
            diseases: diseases,
          );
        },
        error: (error, stackTrace) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bağlantı sağlayarak tekrar deneyin'),
              ),
            );
          });
          // Navigate to MainPage(); with no transition
          return Scaffold(
            appBar: AppBar(),
            body: const Center(
              child: Text('İnternet bağlantısı yok.'),
            ),
          );
        },
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ));
  }
}

class PrescSearchPage extends StatelessWidget {
  PrescSearchPage({
    required this.diseases,
    super.key,
  });

  final List<Disease> diseases;
  final searchHistoryBox = Hive.box<String>('searchHistory');

  @override
  Widget build(BuildContext context) {
    final List<Speciality> specialities = diseases
        .map((Disease disease) => disease.specialities!)
        .expand((List<Speciality> specialities) => specialities)
        .toSet()
        .toList();

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          const SliverAppBar(
            title: Text('Reçete Önerileri'),
            floating: true,
            snap: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Toplam ${diseases.length} Hastalık \nİçin Güncel ',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    TextSpan(
                      text: 'Reçete ',
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    TextSpan(
                      text: 'Önerileri',
                      style: Theme.of(context).textTheme.headlineLarge,
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchAnchor(
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  if (controller.text.isEmpty) {
                    if (searchHistoryBox.isNotEmpty) {
                      return getHistoryList(controller);
                    }
                  }
                  return getSuggestions(context, controller);
                },
                builder: (BuildContext context, SearchController controller) {
                  return const CustomSearchBar();
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text('Kategoriler',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
          )),
          ...List.generate(
              specialities.length,
              (index) => SliverToBoxAdapter(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      child: SpecialityCard(
                        speciality: specialities[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryResultsPage(
                                  speciality: specialities[index],
                                  diseases: diseases
                                      .where((Disease disease) => disease
                                          .specialities!
                                          .contains(specialities[index]))
                                      .toList()),
                            ),
                          );
                        },
                      ))))
        ]),
      ),
    );
  }

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistoryBox.values
        .cast<String>()
        .map(
          (String disease) => ListTile(
            leading: const Icon(Icons.history),
            title: Text(disease),
            trailing: IconButton(
              icon: const Icon(Icons.call_missed),
              onPressed: () {
                controller.text = disease;

                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              },
            ),
          ),
        )
        .toList()
        .reversed;
  }

  Iterable<Widget> getSuggestions(BuildContext context, controller) {
    final String input = controller.value.text.toLowerCase();

    return diseases
        .where((Disease disease) => disease.name!.toLowerCase().contains(input))
        .map(
          (Disease filteredDisease) => ListTile(
            leading: const Icon(Icons.medical_services),
            title: Text(filteredDisease.name!),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              handleSelection(context, filteredDisease);
            },
          ),
        );
  }

  void handleSelection(BuildContext context, Disease filteredDisease) {
    if (searchHistoryBox.length >= 5) {
      searchHistoryBox.deleteAt(searchHistoryBox.length - 1);
    }
    searchHistoryBox.add(filteredDisease.name!);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DiseaseDetailPage(disease: filteredDisease)));
  }
}

/// Custom Serach Bar view without functionality
class CustomSearchBar extends StatelessWidget {
  final String hintText;
  const CustomSearchBar({
    super.key,
    this.hintText = 'Hastalık Ara',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              width: 1.5),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Icon(Icons.search),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              hintText,
            ),
          ),
        ],
      ),
    );
  }
}
