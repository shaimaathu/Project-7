import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/date_piker.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/list_tile_contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceData extends StatelessWidget {
  const ExperienceData(
      {super.key,
      required this.nameController,
      required this.jobTitleController,
      required this.startJobDateController,
      required this.endDateJobController,
      required this.title,
      this.onPressed,
      this.visible = false});
  final TextEditingController nameController;
  final TextEditingController jobTitleController;
  final TextEditingController startJobDateController;
  final TextEditingController endDateJobController;
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
          controller: nameController,
          title: "Company name:",
        ),
        ListTileContact(
          controller: jobTitleController,
          title: "Job title:",
        ),
        BirthDate(
          controller: startJobDateController,
          title: "Start date:",
          hint: "Start date",
        ),
        BirthDate(
          controller: endDateJobController,
          title: "End date:",
          hint: "End date",
        ),
      ],
    );
  }
}
