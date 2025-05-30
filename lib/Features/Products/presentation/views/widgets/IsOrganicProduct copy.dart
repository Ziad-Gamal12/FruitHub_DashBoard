import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/widgets/TermsCheckBox.dart';

class Isorganicproduct extends StatelessWidget {
  final ValueChanged<bool> onChanged;

  const Isorganicproduct({super.key, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Row(
        children: [
          checkbox(
            onChanged: onChanged,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: SizedBox(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Is this product Organic?",
                    style: textStyles.textstyle13
                        .copyWith(color: const Color(0xff0000000)))
              ])),
            ),
          )
        ],
      ),
    );
  }
}
