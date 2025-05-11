import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomExpansionWidget.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:provider/provider.dart';

class CustomOrderItemOrderDetails extends StatelessWidget {
  const CustomOrderItemOrderDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrderEntity order = context.read<OrderEntity>();

    return Customexpansionwidget(
      title: "Order Details",
      leadingWidget: const Icon(
        FontAwesomeIcons.receipt,
        color: Colors.green,
      ).animate().scale(duration: 500.ms),
      child: Column(
        children: [
          Rowinfo(
            title: "Total Price",
            isSpaced: true,
            value:
                "${order.orderProducts.map((e) => e.price).reduce((value, element) => value + element)}\$",
          ),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
              title: "Items",
              value: "${order.orderProducts.length} items",
              isSpaced: true),
          const SizedBox(
            height: 4,
          ),
          Rowinfo(
            title: "Payment Method",
            isSpaced: true,
            value: order.paymentMethod,
          ),
        ],
      ),
    );
  }
}
