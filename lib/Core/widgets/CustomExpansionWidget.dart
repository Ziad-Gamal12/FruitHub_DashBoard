import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

// ignore: must_be_immutable
class Customexpansionwidget extends StatelessWidget {
  Customexpansionwidget(
      {super.key,
      required this.child,
      required this.title,
      this.leadingWidget});
  final Widget child;
  final String title;
  Widget? leadingWidget;
  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      initiallyExpanded: false,
      titleBuilder: (animationValue, easeInValue, isExpanded, toggleFunction) {
        return InkWell(
          onTap: () => toggleFunction(animated: true),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              title: Text(
                title,
                style: textStyles.textstyle19.copyWith(
                  color: Colors.black,
                ),
              ),
              trailing: Transform.rotate(
                  angle: easeInValue * 3.14,
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black,
                  )),
              leading: leadingWidget,
            ),
          ),
        );
      },
      content: child,
    );
  }
}
