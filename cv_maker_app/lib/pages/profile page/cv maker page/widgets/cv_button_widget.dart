import 'package:cv_maker_app/helper/colors.dart';
import 'package:cv_maker_app/helper/extintion.dart';
import 'package:flutter/material.dart';

class CVButtonWidget extends StatelessWidget {
  const CVButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        style: ButtonStyle(
            shadowColor: MaterialStatePropertyAll(text1),
            backgroundColor: MaterialStatePropertyAll(firstColor),
            elevation: const MaterialStatePropertyAll(6),
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))))),
        onPressed: onPress,
        child: SizedBox(
          width: context.getWidth(),
          height: context.getWidth() / 7.5,
          child: Center(
            child: Text(
              title,
              style: TextStyle(fontSize: 30, color: whit),
            ),
          ),
        ),
      ),
    );
  }
}
