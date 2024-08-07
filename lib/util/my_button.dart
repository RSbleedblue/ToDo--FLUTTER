import 'package:assignment7todo/themes/app_palettes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;
  MyButton({super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppPalettes.lightColor,
      child: Text(
        buttonName,
        style: TextStyle(color: AppPalettes.primaryColor),
      ),
    );
  }
}
