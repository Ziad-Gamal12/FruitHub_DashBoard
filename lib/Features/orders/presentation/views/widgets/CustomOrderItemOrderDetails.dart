import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomExpansionWidget.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';

class CustomOrderItemOrderDetails extends StatelessWidget {
  const CustomOrderItemOrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Customexpansionwidget(
      title: "Order Details",
      leadingWidget: const Icon(
        FontAwesomeIcons.receipt,
        color: Colors.green,
      ),
      child: Column(
        children: [
          Rowinfo(
            title: "Total Price",
            isSpaced: true,
            value: "800\$",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(title: "Items", value: "5 items", isSpaced: true),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Payment Method",
            isSpaced: true,
            value: "Cash on Delivery",
          ),
        ],
      ),
    );
  }
}
