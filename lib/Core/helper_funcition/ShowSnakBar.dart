import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

showSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.antiAlias,
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: textStyles.textstyle13.copyWith(color: Colors.white),
    ),
  ));
}
