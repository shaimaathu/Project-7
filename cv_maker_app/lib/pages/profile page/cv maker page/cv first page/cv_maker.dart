import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/cv%20first%20page/widgets/contact_card.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/cv_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../education page/education_page.dart';

class CvMaker extends StatelessWidget {
  CvMaker({super.key});
  final locator = GetIt.I.get<AllData>();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
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
        child: Column(
          children: [
            ContactInfo(
              addressController: addressController,
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              dateOfBirthController: dateOfBirthController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: CVButtonWidget(
        title: 'save',
        onPress: () {
          if (emailController.text != "" &&
              nameController.text != "" &&
              phoneController.text != "" &&
              addressController.text != "" &&
              dateOfBirthController.text != "") {
            locator.email = emailController.text;
            locator.name = nameController.text;
            locator.phone = phoneController.text;
            locator.address = addressController.text;
            locator.dateOfBirth = dateOfBirthController.text;
            context.pushTo(view: const Education());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('fill the data first ! ')),
            );
          }
        },
      ),
    );
  }
}
