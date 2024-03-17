import 'package:cv_maker_app/data/data_layer.dart';
import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/helper/sized.dart';
import 'package:cv_maker_app/pages/bloc/cv_bloc.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/cv_button_widget.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/list_tile_contact.dart';
import 'package:cv_maker_app/pages/profile%20page/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final locator = GetIt.I.get<AllData>();
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CvBloc>();
    TextEditingController skillController = TextEditingController();
    TextEditingController objectiveController = TextEditingController();
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
              child: Column(
                children: [
                  gapH10,
                  Text(
                    "objective and Skills :",
                    style: TextStyle(
                        fontSize: 20,
                        color: black,
                        fontWeight: FontWeight.bold),
                  ),
                  gapH10,
                  gapH10,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        ListTileContact(
                          controller: skillController,
                          title: "Skills:",
                        ),
                        ListTileContact(
                          controller: objectiveController,
                          title: "objective:",
                        ),
                      ],
                    ),
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
          if (_formKey.currentState!.validate()) {
            locator.skills = skillController.text;
            locator.objective = objectiveController.text;
            bloc.add(AddCvEvent());
            context.pushTo(view: const ProfilePage());
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please fill the data')),
            );
          }
        },
      ),
    );
  }
}
