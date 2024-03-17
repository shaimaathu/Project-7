
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView(
      {super.key,
      required this.nameData,
      required this.emailData,
      required this.addressData,
      required this.phoneData,
      required this.dateOfBirthData});
  final String nameData;
  final String emailData;
  final String addressData;
  final String phoneData;
  final String dateOfBirthData;

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
              "contact information",
              style: TextStyle(
                  fontSize: 20, color: black, fontWeight: FontWeight.w600),
            ),
          ),
          gapH10,
          Text(
            "Name:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            nameData,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Email:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            emailData,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Address:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            addressData,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            "Phone:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            phoneData,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
          Text(
            "Date of birth:",
            style: TextStyle(
                fontSize: 20, color: black, fontWeight: FontWeight.w600),
          ),
          gapH10,
          Text(
            dateOfBirthData,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
