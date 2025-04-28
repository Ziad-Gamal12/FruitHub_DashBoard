import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomExpansionWidget.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';

class CustomOrderItemOrderShipping extends StatelessWidget {
  const CustomOrderItemOrderShipping({super.key});

  @override
  Widget build(BuildContext context) {
    return Customexpansionwidget(
        title: "Shipping",
        leadingWidget: const Icon(
          FontAwesomeIcons.truckFast,
          color: Colors.green,
        ),
        child: Column(children: [
          Rowinfo(
            title: "Full Name",
            value: "Ahmed Ali",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Email",
            value: "RdY5s@example.com",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Phone",
            value: "0123456789",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Address",
            value: "Cairo",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "City",
            value: "Cairo",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Flat Number",
            value: "2",
          ),
        ]));
  }
}
