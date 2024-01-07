// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:farmadex_models/farmadex_models.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({
    Key? key,
    required this.prescription,
    required this.index,
  }) : super(key: key);

  final Prescription prescription;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(prescription.name ?? ' '),
                      )
                    ],
                  ),
                  Text(prescription.shortDescription ?? ' '),
                  const Text(
                    'Rx:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const Divider(height: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: prescription.medicines?.length ?? 0,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1} - ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Expanded(
                        child: MedicineSection(
                            medicine: prescription.medicines![index])),
                  ],
                );
              },
            ),
            if (prescription.explanation != null &&
                prescription.explanation!.isNotEmpty) ...[
              const Divider(
                thickness: 2,
                height: 20,
                color: Colors.black45,
              ),
              ExplanationsSection(
                explanations: prescription.explanation!,
              )
            ]
          ],
        ),
      );
    });
  }
}

class MedicineSection extends StatelessWidget {
  const MedicineSection({
    super.key,
    required this.medicine,
  });

  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(text: medicine.name),
              const TextSpan(text: "\n"),
              TextSpan(
                text: medicine.activeSubstance,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              children: [
                const TextSpan(
                  text: 'S: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: '${medicine.howOften} x',
                ),
                TextSpan(
                  text: ' ${medicine.howMany}      ',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ExplanationsSection extends StatelessWidget {
  const ExplanationsSection({super.key, required this.explanations});

  final List<String> explanations;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 8, 16.0, 0),
          child: Text('Ek açıklamalar',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.separated(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
          separatorBuilder: (context, index) => const Divider(height: 20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: explanations.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1} -  ${explanations[index]}',
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
