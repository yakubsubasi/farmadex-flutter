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
              const SizedBox(height: 10.0), // Add a SizedBox here
              ...List.generate(
                disease.prescriptions?.length ?? 0,
                (index) => PrescriptionCard(
                  index: index,
                  prescription: disease.prescriptions![index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WarningCard extends StatelessWidget {
  final String warningText;

  const WarningCard({Key? key, required this.warningText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.errorContainer,
      child: ListTile(
        leading: Icon(
          Icons.warning,
          color: Theme.of(context).colorScheme.error,
          size: 40.0,
        ),
        title: Text(
          warningText,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
