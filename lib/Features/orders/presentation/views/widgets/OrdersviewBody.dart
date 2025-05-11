import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrdersListView.dart';
import 'package:fruits_hub_dashboard/constent.dart';

class OrdersviewBody extends StatefulWidget {
  const OrdersviewBody({super.key});

  @override
  State<OrdersviewBody> createState() => _OrdersviewBodyState();
}

class _OrdersviewBodyState extends State<OrdersviewBody> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: KHorizontalPadding),
        child: Orderslistview());
  }
}
