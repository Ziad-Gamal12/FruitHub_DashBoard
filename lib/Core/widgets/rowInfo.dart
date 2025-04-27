import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class Rowinfo extends StatelessWidget {
  Rowinfo({super.key, required this.title, required this.value, this.isSpaced});
  final String title;
  final String value;
  bool? isSpaced;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: textStyles.textstyle16.copyWith(color: Colors.black),
        ),
        isSpaced != null
            ? const Spacer()
            : const SizedBox(
                width: 4,
              ),
        Text(
          value,
          style: textStyles.textstyle13.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
