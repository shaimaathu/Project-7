import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:flutter/material.dart';

class SkillView extends StatelessWidget {
  const SkillView({
    super.key,
    required this.skills,
    required this.objective,
  });
  final String skills;
  final String objective;

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
              "skills and objective",
              style: TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.w600),
            ),
          ),
          gapH10,
          Text(
            "skills:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            skills,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "objective:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            objective,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
