import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:flutter/material.dart';

class EducationView extends StatelessWidget {
  const EducationView({
    super.key,
    required this.universityName,
    required this.startDate,
    required this.endDate,
    required this.degree,
    required this.specialization,
  });
  final String universityName;
  final String startDate;
  final String endDate;
  final String degree;
  final String specialization;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: border),
        color: cont,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: text1,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH10,
          Center(
            child: Text(
              "Education",
              style: TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.w600),
            ),
          ),
          gapH10,
          Text(
            "University name:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            universityName,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Major:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            specialization,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Degree:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            degree,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Start date:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            startDate,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          Text(
            "End date:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            endDate,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
