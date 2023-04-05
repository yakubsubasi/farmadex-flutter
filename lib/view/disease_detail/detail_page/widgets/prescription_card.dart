import 'package:flutter/material.dart';

import '../../../../model/disease_model/prescription_model.dart';

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({Key? key, required this.prescription})
      : super(key: key);

  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(prescription.name ?? ' '),
              Text(prescription.shortDescription ?? ' '),
              const Text(
                'Rx: \n',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: prescription.medicines?.length ?? 0,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "${index + 1} -  ${prescription.medicines![index].name} \n ",
                          style: const TextStyle(fontSize: 18)),
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
                                text:
                                    '${prescription.medicines![index].howOften} x',
                              ),
                              TextSpan(
                                text:
                                    ' ${prescription.medicines![index].howMany}      ',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
