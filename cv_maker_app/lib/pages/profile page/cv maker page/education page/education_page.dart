import 'dart:convert';

import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/data/model/education_model.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/education%20page/widgets/education_data.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/experience%20page/experience_page.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/cv_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Education extends StatefulWidget {
  const Education({super.key});
  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  final locator = GetIt.I.get<AllData>();
  TextEditingController universityController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

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
    if (locator.userCv.fullName != "") {
      final userCv = locator.userCv;
      EducationModel userEducation =
          EducationModel.fromJson(jsonDecode(userCv.education));
      universityController.text = userEducation.universityName;
      degreeController.text = userEducation.degree;
      majorController.text = userEducation.specialization;
      startDateController.text = userEducation.startDate;
      endDateController.text = userEducation.endDate;
    }
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
                      EducationData(
                          universityController: universityController,
                          degreeController: degreeController,
                          MajorController: majorController,
                          StartDateController: startDateController,
                          EndDateController: endDateController,
                          title: 'Education:',
                          visible: false,
                          onPressed: () {}),
                      // Column(
                      //   children:
                      //       locator.educationList.asMap().entries.map((entry) {
                      //     int index = entry.key;
                      //     return EducationData(
                      //         universityController: universityController,
                      //         degreeController: degreeController,
                      //         MajorController: majorController,
                      //         StartDateController: startDateController,
                      //         EndDateController: endDateController,
                      //         title: 'Education ${index + 1}',
                      //         visible: true,
                      //         onPressed: () => deleteEducation(index));
                      //   }).toList(),
                      // ),
                      // CVButtonWidget(
                      //   onPress: addEducation,
                      //   title: 'Add Education',
                      // ),
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
          if (universityController.text != "" &&
              majorController.text != "" &&
              startDateController.text != "" &&
              endDateController.text != "" &&
              degreeController.text != "") {
            locator.educationList.add(
              EducationModel(
                universityName: universityController.text,
                specialization: majorController.text,
                startDate: startDateController.text,
                endDate: endDateController.text,
                degree: degreeController.text,
              ),
            );
            print("added ${locator.educationList.length}");
            context.pushTo(view: const Experience());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('fill the data first ! ')),
            );
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

  void addEducation() {
    setState(() {
      locator.educationList.add(
        EducationModel(
          universityName: universityController.text,
          specialization: majorController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          degree: degreeController.text,
        ),
      );
      print("added ${locator.educationList.length}");
    });
  }
}





// Column(
//               children: [
//                 ListTileContact(
//                   controller: universityController,
//                   title: "university:",
//                 ),
//                 ListTileContact(
//                   controller: degreeController,
//                   title: "Degree :",
//                 ),
//                 ListTileContact(
//                   controller: MajorController,
//                   title: "Major:",
//                 ),
//                 BirthDate(
//                   controller: StartDateController,
//                   title: "Start date:",
//                   hint: "Start date",
//                 ),
//                 BirthDate(
//                   controller: EndDateController,
//                   title: "End date:",
//                   hint: "End date",
//                 ),
//               ],
//             ),

