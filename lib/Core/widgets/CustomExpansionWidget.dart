import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class Customexpansionwidget extends StatelessWidget {
  const Customexpansionwidget(
      {super.key, required this.child, required this.title});
  final Widget child;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      initiallyExpanded: false,
      titleBuilder: (animationValue, easeInValue, isExpanded, toggleFunction) {
        return InkWell(
          onTap: () => toggleFunction(animated: true),
          child: Row(
            children: [
              Text(
                title,
                style: textStyles.textstyle19.copyWith(
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Transform.rotate(
                  angle: easeInValue * 3.14,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  ))
            ],
          ),
        );
      },
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: child,
      ),
    );
  }
}
