import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomExpansionWidget.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderDetails.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderFruitsItems.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderShipping.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrderItemOrderInfo.dart';

class OrderListViewOrderItem extends StatelessWidget {
  const OrderListViewOrderItem({super.key, required this.inExpanded});
  final bool inExpanded;
  @override
  Widget build(BuildContext context) {
    return Customexpansionwidget(
      title: "Order #2532545151321",
      isExpanded: inExpanded,
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderItemOrderInfo(),
              Divider(
                height: 20,
                color: Colors.black,
              ),
              CustomOrderItemOrderDetails(),
              Divider(
                height: 20,
                color: Colors.black,
              ),
              CustomOrderItemOrderShipping(),
              Divider(
                height: 20,
                color: Colors.black,
              ),
              Customorderitemorderfruitsitems()
            ],
          )),
    );
  }
}
