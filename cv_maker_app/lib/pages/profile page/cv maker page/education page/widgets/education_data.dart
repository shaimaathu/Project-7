import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/date_piker.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/list_tile_contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationData extends StatelessWidget {
  const EducationData(
      {super.key,
      required this.universityController,
      required this.degreeController,
      required this.MajorController,
      required this.StartDateController,
      required this.EndDateController,
      required this.title,
      this.onPressed, 
      this.visible = false});
  final TextEditingController universityController;
  final TextEditingController degreeController;
  final TextEditingController MajorController;
  final TextEditingController StartDateController;
  final TextEditingController EndDateController;
  final String title;
  final Function()? onPressed;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                visible: visible,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: onPressed,
                ),
              ),
            ],
          ),
        ),
        ListTileContact(
          controller: universityController,
          title: "university:",
        ),
        ListTileContact(
          controller: degreeController,
          title: "Degree:",
        ),
        ListTileContact(
          controller: MajorController,
          title: "Major:",
        ),
        BirthDate(
          controller: StartDateController,
          title: "Start date:",
          hint: "Start date",
        ),
        BirthDate(
          controller: EndDateController,
          title: "End date:",
          hint: "End date",
        ),
      ],
    );
  }
}
