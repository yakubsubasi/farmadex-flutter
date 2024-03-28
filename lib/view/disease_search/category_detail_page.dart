import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farmadex_models/farmadex_models.dart';
import '../disease_detail/detail_page/detail_page.dart';

class CategoryResultsPage extends StatelessWidget {
  const CategoryResultsPage(
      {Key? key, required this.speciality, required this.diseases})
      : super(key: key);

  final Speciality speciality;
  final List<Disease> diseases;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).cardColor,
            expandedHeight: 170.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          speciality.valeu,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                color: const Color(0xFF000000),
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          '${diseases.length} hastalık',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Hero(
                    tag: speciality.toString(),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.white38,
                      child: Image.asset(
                        speciality.imagepath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              expandedTitleScale: 1,
            ),
          ),
          // text 'Tüm reçeteler'
          //
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Tüm reçeteler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CupertinoListTile.notched(
                  trailing: const Icon(Icons.arrow_forward_ios),
                  leading: const Icon(Icons.medical_services_outlined),
                  title: Text(diseases[index].name!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DiseaseDetailPage(
                          disease: diseases[index],
                        ),
                      ),
                    );
                  },
                );
              },
              childCount: diseases.length,
            ),
          ),
        ],
      ),
    );
  }
}
