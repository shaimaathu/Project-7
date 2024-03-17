import 'dart:convert';

import 'package:cv_maker_app/data/model/cv_model.dart';
import 'package:cv_maker_app/data/model/education_model.dart';
import 'package:cv_maker_app/data/model/experience_model.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:cv_maker_app/pages/home%20page/view%20cv/widgets/contact_cv_view.dart';
import 'package:cv_maker_app/pages/home%20page/view%20cv/widgets/education_view.dart';
import 'package:cv_maker_app/pages/home%20page/view%20cv/widgets/skill_objective_view.dart';
import 'package:flutter/material.dart';

import 'widgets/experience_view.dart';

class ViewCv extends StatelessWidget {
  const ViewCv({super.key, required this.cv});
  final CVModel cv;
  @override
  Widget build(BuildContext context) {
    ExperienceModel userExperience =
        ExperienceModel(company: "", endDate: "", position: "", startDate: "");
    EducationModel userEducation =
        EducationModel.fromJson(jsonDecode(cv.education));
    if (cv.experience!.isNotEmpty) {
      userExperience = ExperienceModel.fromJson(jsonDecode(cv.experience!));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text(
          "Resume",
          style:
              TextStyle(fontSize: 30, color: whit, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ContactView(
              addressData: cv.address,
              dateOfBirthData: cv.dateOfBirth,
              emailData: cv.email,
              nameData: cv.fullName,
              phoneData: cv.phoneNumber,
            ),
            gapH10,
            SkillView(
              objective: cv.objective,
              skills: cv.skills,
            ),
            gapH10,
            EducationView(
              universityName: userEducation.universityName,
              degree: userEducation.degree,
              specialization: userEducation.specialization,
              startDate: userEducation.startDate,
              endDate: userEducation.endDate,
            ),
            Visibility(
              visible: userExperience.company == "" ? false : true,
              child: ExperienceView(
                company: userExperience.company,
                position: userExperience.position,
                startDate: userExperience.startDate,
                endDate: userExperience.endDate,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
