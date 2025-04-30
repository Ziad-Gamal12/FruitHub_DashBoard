import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomExpansionWidget.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderDetails.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderFruitsItems.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderShipping.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrderItemOrderInfo.dart';
import 'package:provider/provider.dart';

class OrderListViewOrderItem extends StatelessWidget {
  const OrderListViewOrderItem(
      {super.key, required this.inExpanded, required this.order});
  final bool inExpanded;
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: order,
      child: Animate(
        effects: [
          SlideEffect(
            begin: const Offset(0, 0.2),
            end: Offset.zero,
            duration: 600.ms,
            curve: Curves.easeOut,
          ),
          FadeEffect(duration: 600.ms)
        ],
        child: Customexpansionwidget(
          titleStyle: textStyles.textstyle16.copyWith(color: Colors.black),
          title: "#${order.orderId}",
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
        ),
      ),
    );
  }
}
