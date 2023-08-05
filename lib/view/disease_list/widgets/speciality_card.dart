// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:farmadex_models/farmadex_models.dart';

class SpecialityCard extends StatelessWidget {
  final Speciality speciality;
  final Function() onTap;

  const SpecialityCard(
      {super.key, required this.speciality, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 8.0,
        ),
        horizontalTitleGap: 25,
        hoverColor: Theme.of(context).hintColor,
        leading: Hero(
          tag: speciality.toString(),
          child: Image.asset(
            speciality.imagepath,
            width: 50,
          ),
        ),
        title: RichText(
          text: TextSpan(
              text: speciality.valeu,
              style: Theme.of(context).textTheme.headlineMedium),
        ),
      ),
    );
  }
}
