import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/date_piker.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/list_tile_contact.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

// ignore: must_be_immutable
class ContactInfo extends StatelessWidget {
  ContactInfo(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.phoneController,
      required this.addressController,
      required this.dateOfBirthController});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final locator = GetIt.I.get<AllData>();
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;
  TextEditingController addressController;
  TextEditingController dateOfBirthController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: border),
            color: cont,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: text1,
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "contact information",
                style: TextStyle(
                    fontSize: 20, color: black, fontWeight: FontWeight.bold),
              ),
              gapH10,
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapH30,
                    ListTileContact(
                      controller: nameController,
                      title: "Name:",
                    ),
                    gapH10,
                    ListTileContact(
                      controller: emailController,
                      title: "Email:",
                    ),
                    gapH10,
                    ListTileContact(
                      controller: phoneController,
                      title: "Phone:",
                      num: true,
                    ),
                    gapH10,
                    ListTileContact(
                      controller: addressController,
                      title: "Address:",
                    ),
                    BirthDate(
                      controller: dateOfBirthController,
                      title: "date of Birth:",
                      hint: "date of Birth",
                    ),
                    gapH30,
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
