import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrderListViewOrderItem.dart';

class Orderslistview extends StatelessWidget {
  const Orderslistview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: OrderListViewOrderItem(
            inExpanded: index == 0 ? true : false,
          ),
        );
      },
    );
  }
}
