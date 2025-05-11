// ignore_for_file: must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class Customorderstatusdropdownbutton extends StatelessWidget {
  Customorderstatusdropdownbutton({
    super.key,
    required this.status,
    required this.statusChanged,
  });
  List<String> orderStatus = [
    "Pending",
    "Preparing",
    "Shipped",
    "Delivered",
    "Cancelled"
  ];
  final String status;
  final ValueChanged<String?> statusChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      hint: Text(
        status,
        style: textStyles.textstyle16.copyWith(color: statueColor(status)),
      ),
      items: orderStatus
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:
                      textStyles.textstyle16.copyWith(color: statueColor(item)),
                ),
              ))
          .toList(),
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      onChanged: (value) {
        statusChanged(value);
      },
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  Color statueColor(String status) {
    String statusLower = status.toLowerCase();
    switch (statusLower) {
      case "pending":
        return Colors.orange;
      case "preparing":
        return Colors.blue;
      case "outForDelivery":
        return Colors.deepPurple;
      case "delivered":
        return Colors.green;
      case "cancelled":
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
