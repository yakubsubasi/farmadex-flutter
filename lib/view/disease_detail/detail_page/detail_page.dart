import 'package:farmadex/view/disease_detail/detail_page/widgets/prescription_card.dart';
import 'package:farmadex_models/farmadex_models.dart';
import 'package:flutter/material.dart';

class DiseaseDetailPage extends StatelessWidget {
  const DiseaseDetailPage({
    Key? key,
    required this.disease,
  }) : super(key: key);

  final Disease disease;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          disease.name ?? ' ',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (disease.warnings != null && disease.warnings!.isNotEmpty)
                if (disease.warnings!.first.isNotEmpty)
                  ...List.generate(
                    disease.warnings!.length,
                    (index) =>
                        WarningCard(warningText: disease.warnings![index]),
                  ),
              ...List.generate(
                disease.prescriptions?.length ?? 0,
                (index) => Column(
                  children: [
                    PrescriptionCard(
                      index: index,
                      prescription: disease.prescriptions![index],
                    ),
                    if (index != (disease.prescriptions?.length ?? 1) - 1)
                      const SizedBox(height: 10),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              WarningCard(
                  title: 'Uyarı',
                  color: Theme.of(context).colorScheme.primaryContainer,
                  warningText:
                      'Bu reçeteler sadece tıp hekimleri için örnek reçete olarak hazırlanmıştır. Tavsiye niteliği taşımaz. Çünkü aynı hastalıkta bile her hastanın reçetesi kendine özeldir. Sorumluluk yazan kişiye aittir.')
            ],
          ),
        ),
      ),
    );
  }
}

class WarningCard extends StatelessWidget {
  final String warningText;

  final Color? color;

  final String? title;
  const WarningCard(
      {Key? key, required this.warningText, this.color, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color ?? Theme.of(context).colorScheme.errorContainer,
      child: ListTile(
        leading: Column(
          children: [
            if (title != null)
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Icon(
              Icons.warning,
              color: Theme.of(context).colorScheme.error,
              size: 40.0,
            ),
          ],
        ),
        title: Text(
          warningText,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
