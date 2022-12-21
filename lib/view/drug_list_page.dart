import 'package:farmadex/model/Drug/Drug_model.dart';
import 'package:farmadex/view/drug_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrugListPage extends StatelessWidget {
  final List<Drug> drugs;

  const DrugListPage({super.key, required this.drugs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama sonuçları'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(drugs[index].ilacAdi!),
              subtitle: Text(drugs[index].atcAdi!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrugDetailPage(
                      drug: drugs[index],
                    ),
                  ),
                );
              });
        },
        itemCount: drugs.length,
      ),
    );
  }
}
