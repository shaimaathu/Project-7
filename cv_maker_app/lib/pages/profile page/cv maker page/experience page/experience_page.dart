import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/data/model/experience_model.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/experience%20page/widgets/experience_data.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/cv_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Experience extends StatefulWidget {
  const Experience({super.key});

  @override
  State<Experience> createState() => _ExperienceState();
}

class _ExperienceState extends State<Experience> {
  final locator = GetIt.I.get<AllData>();
  TextEditingController nameController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController startJobDateController = TextEditingController();
  TextEditingController endDateJobController = TextEditingController();
  void deleteEducation(int index) {
    setState(() {
      if (locator.educationList.length > 1) {
        locator.educationList.removeAt(index);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('there must be at least one education entry')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          "CV Resume",
          style:
              TextStyle(fontSize: 30, color: whit, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              width: context.getWidth(),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: border),
                color: cont,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: text1,
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Column(
                    children: [
                      ExperienceData(
                          nameController: nameController,
                          jobTitleController: jobTitleController,
                          startJobDateController: startJobDateController,
                          endDateJobController: endDateJobController,
                          title: 'Experience:',
                          visible: false,
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: CVButtonWidget(
              title: 'save',
              onPress: () {
                // if (locator.educationList.isNotEmpty) {
                if (nameController.text != "" &&
                    jobTitleController.text != "" &&
                    startJobDateController.text != "" &&
                    endDateJobController.text != "") {
                  locator.experienceList.add(
                    ExperienceModel(
                      company: nameController.text,
                      position: jobTitleController.text,
                      endDate: endDateJobController.text,
                      startDate: startJobDateController.text,
                    ),
                  );
                  print("added ${locator.experienceList.length}");
                } else {
                  // context.pushTo(view: )
                }
                // } else {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(
                //         content:
                //             Text('Please enter at least one education entry')),
                //   );
                // }
              },
            ),
    );
  }
}
