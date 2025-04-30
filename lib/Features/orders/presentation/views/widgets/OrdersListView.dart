import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrderListViewOrderItem.dart';

class Orderslistview extends StatelessWidget {
  const Orderslistview({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OrderListViewOrderItem(
            order: orders[index],
            inExpanded: index == 0 ? true : false,
          ),
        );
      },
    );
  }
}
