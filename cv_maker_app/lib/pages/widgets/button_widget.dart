import 'package:cv_maker_app/helper/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.title,
    required this.onPress,
  });
  final String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStatePropertyAll(text1),
        backgroundColor: MaterialStatePropertyAll(firstColor),
        elevation: const MaterialStatePropertyAll(6),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: whit),
      ),
    );
  }
}
