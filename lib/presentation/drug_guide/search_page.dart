import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../model/Drug/Drug_model.dart';

final supabase = Supabase.instance.client;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<Drug>> getDrugsfromSupabase() async {
    final response = await supabase.from('ilac_detay').select();
    List<Drug> drugs = List.from(
        response.map((e) => Drug.fromJson(e as Map<String, dynamic>)));

    return drugs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Arama ekranı'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'Arama yapın',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: getDrugsfromSupabase(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return SliverToBoxAdapter(
                        child: Center(
                          child: Text(snapshot.error.toString()),
                        ),
                      );
                    }
                    if (!snapshot.hasData) {
                      return const SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    List<Drug> drugs = snapshot.data as List<Drug>;

                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return ListTile(
                            title: Text(drugs[index].ilacAdi ?? ""),
                            subtitle: Text(drugs[index].atcAdi ?? ""),
                            onTap: () {},
                          );
                        },
                        childCount: drugs.length,
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
