import 'package:farmadex_models/farmadex_models.dart';
import 'package:farmadex/view/disease_detail/detail_page/detail_page.dart';
import 'package:farmadex/view/disease_list/category_detail_page.dart';
import 'package:farmadex/view/disease_list/provider/search_page_provider.dart';
import 'package:farmadex/view/disease_list/widgets/speciality_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
          return Text(error.toString());
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
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: const Text('Farmadex'),
            actions: [
              IconButton(
                //drawer
                icon: const Icon(Icons.menu_sharp),
                onPressed: () {},
              )
            ],
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
              child: SearchAnchor.bar(
                barHintText: 'Örnek reçete ara..',
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
                  if (controller.text.isEmpty) {
                    if (searchHistoryBox.isNotEmpty) {
                      return getHistoryList(controller);
                    }
                    return <Widget>[
                      const Center(
                          child: Text(
                        'No search history.',
                      ))
                    ];
                  }
                  return getSuggestions(context, controller);
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
