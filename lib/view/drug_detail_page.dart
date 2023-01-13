import 'package:farmadex/model/Drug/Drug_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
          Divider(
            thickness: 1,
            height: 32,
          ),
          Row(
            children: [
              Text(
                'Barkod: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(drug.barkod!),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                'ATC adı: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(drug.atcAdi!),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Text(
                'ATC kodu: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(drug.atcKodu!),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Firma: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(drug.firmaAdi!, style: const TextStyle(fontSize: 16)),
          SizedBox(
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
                Text(
                  'Fiyat: ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(drug.fiyat!, style: const TextStyle(fontSize: 16)),
                // add euro icon
                Icon(Icons.euro),
              ],
            ),
          ),
        ]),

        // fiyat
      ),
    );
  }
}
