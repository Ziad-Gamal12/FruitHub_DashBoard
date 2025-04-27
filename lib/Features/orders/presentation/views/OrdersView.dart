import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomAppBar.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrdersviewBody.dart';

class Ordersview extends StatelessWidget {
  const Ordersview({super.key});
  static const routeName = "OrdersView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(appBartitle: "Orders"),
      body: OrdersviewBody(),
    );
  }
}
