import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderStatusDropDownButton.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/UpdateOrderStatusTextWidget.dart';
import 'package:provider/provider.dart';

class OrderItemOrderInfo extends StatefulWidget {
  const OrderItemOrderInfo({
    super.key,
  });

  @override
  State<OrderItemOrderInfo> createState() => _OrderItemOrderInfoState();
}

class _OrderItemOrderInfoState extends State<OrderItemOrderInfo> {
  late String status;

  @override
  void initState() {
    if (mounted) {
      OrderEntity order = context.read<OrderEntity>();
      status = order.orderStatus;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderEntity order = context.read<OrderEntity>();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Rowinfo(title: "ID", value: order.orderId),
            const SizedBox(
              height: 4,
            ),
            const SizedBox(
              height: 4,
            ),
            Rowinfo(
                title: "Created At",
                value:
                    "${order.createdAt.day}/${order.createdAt.month}/${order.createdAt.year}"),
            const SizedBox(
              height: 4,
            ),
            Customorderstatusdropdownbutton(
              status: order.orderStatus,
              statusChanged: (value) {
                setState(() {
                  status = value!;
                });
              },
            ),
            const SizedBox(
              height: 4,
            ),
            UpdateOrderStatusTextWidget(status: status, order: order)
          ],
        ),
      ],
    );
  }
}
