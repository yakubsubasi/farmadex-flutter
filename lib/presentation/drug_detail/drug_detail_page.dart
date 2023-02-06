import 'package:farmadex/model/Drug/Drug_model.dart';
import 'package:flutter/material.dart';

class DrugDetailPage extends StatelessWidget {
  final Drug drug;
  const DrugDetailPage({super.key, required this.drug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İlaç detayı'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            drug.ilacAdi!,
            style: const TextStyle(fontSize: 24),
          ),
          const Divider(
            height: 32,
          ),
          Row(
            children: [
              const Text(
                'ATC adı: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(drug.atcAdi!),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Text(
                'ATC kodu: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(drug.atcKodu!),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Firma: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(drug.firmaAdi!, style: const TextStyle(fontSize: 16)),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal[200],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Fiyat: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(drug.fiyat!, style: const TextStyle(fontSize: 16)),
                // add euro icon
                const Icon(Icons.euro),
              ],
            ),
          ),
        ]),

        // fiyat
      ),
    );
  }
}
