import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:flutter/material.dart';

class ExperienceView extends StatelessWidget {
  const ExperienceView({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.company,
    required this.position,
  });
  final String company;
  final String position;
  final String startDate;
  final String endDate;

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
              "Experience",
              style: TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.w600),
            ),
          ),
          gapH10,
          Text(
            "Company name:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            company,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Position:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            position,
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
