import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:flutter/material.dart';

class BirthDate extends StatelessWidget {
  const BirthDate(
      {super.key,
      required this.title,
      required this.hint,
      required this.controller});
  final String title;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    DateTime startDate;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 1),
      leading: SizedBox(
        width: context.getWidth() / 5,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 18, color: black, fontWeight: FontWeight.w600),
        ),
      ),
      title: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        width: context.getWidth() / 1.6,
        height: context.getWidth() / 7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: cont,
            border: Border.all(color: border, width: 2)),
        child: TextFormField(
          readOnly: true,
          controller: controller,
          enableSuggestions: false,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: InputBorder.none,
            suffix: InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2025),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: ColorScheme.dark(
                            onPrimary: whit,
                            onSurfaceVariant: secondColor,
                            primary: secondColor),
                        dialogBackgroundColor: firstColor,
                      ),
                      child: child!,
                    );
                  },
                ).then((value) => {
                      if (value == null)
                        {}
                      else
                        {
                          startDate = value,
                          controller.text =
                              "${startDate.day} / ${startDate.month} / ${startDate.year} "
                        }
                    });
              },
              child: Icon(
                Icons.calendar_month_outlined,
                color: firstColor,
              ),
            ),
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ),
    );
  }
}
