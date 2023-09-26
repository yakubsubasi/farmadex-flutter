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
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(
          disease.name ?? ' ',
          style: const TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: disease.prescriptions?.length ?? 0,
          itemBuilder: (context, index) {
            return PrescriptionCard(
              index: index,
              prescription: disease.prescriptions![index],
            );
          },
        ),
      ),
    );
  }
}
