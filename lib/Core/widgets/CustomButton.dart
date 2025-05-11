// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/App_Colors.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.bottonColor,
      required this.onPressed,
      this.textColor,
      this.isBordered,
      required this.text});
  final void Function() onPressed;
  final String text;
  Color? bottonColor;
  Color? textColor;
  bool? isBordered;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 54,
      minWidth: double.infinity,
      color: bottonColor ?? AppColors.MainColor,
      shape: RoundedRectangleBorder(
          side: isBordered != null && isBordered == true
              ? const BorderSide(width: 1, color: Colors.black)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(16)),
      onPressed: onPressed,
      child: Text(
        text,
        style: textStyles.textstyle16.copyWith(
            fontWeight: FontWeight.w700, color: textColor ?? Colors.white),
      ),
    );
  }
}
