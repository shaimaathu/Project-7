import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:cv_maker_app/pages/profile%20page/cv%20maker%20page/widgets/contact_textfield_widget.dart';
import 'package:flutter/material.dart';

class ListTileContact extends StatelessWidget {
  const ListTileContact(
      {super.key,
      required this.title,
      required this.controller,
      this.num = false});
  final String title;
  final TextEditingController controller;
  final bool num;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        leading: SizedBox(
          width: context.getWidth() / 4.9,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 18, color: black, fontWeight: FontWeight.w600),
          ),
        ),
        title: Expanded(
          child: ContactTextfield(
            hintText: "enter your $title",
            textController: controller,
            num: num,
          ),
        ),
      ),
    );
  }
}
