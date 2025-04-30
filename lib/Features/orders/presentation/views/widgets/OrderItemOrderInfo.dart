import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:provider/provider.dart';

class OrderItemOrderInfo extends StatelessWidget {
  const OrderItemOrderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OrderEntity order = context.read<OrderEntity>();
    return Column(
      children: [
        Row(
          children: [
            Rowinfo(title: "ID", value: order.orderId),
            const Spacer(),
            Rowinfo(title: "Status", value: order.orderStatus),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Rowinfo(
            title: "Created At",
            value:
                "${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year}"),
      ],
    );
  }
}
