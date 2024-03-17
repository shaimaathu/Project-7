import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactTextfield extends StatelessWidget {
  const ContactTextfield(
      {super.key,
      required this.hintText,
      this.textController,
      this.pass = false,
      this.num = false});
  final String hintText;
  final TextEditingController? textController;
  final bool pass;
  final bool num;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: context.getWidth() / 1.6,
      height: context.getWidth() / 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: cont,
          border: Border.all(color: border, width: 2)),
      child: TextFormField(
        // expands: true,
        keyboardType: TextInputType.multiline,
        inputFormatters: num
            ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
            : <TextInputFormatter>[],
        maxLines: pass ? 1 : null,
        controller: textController,
        obscureText: pass,
        enableSuggestions: false,
        decoration: InputDecoration(
            hintText: hintText, enabledBorder: InputBorder.none),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
