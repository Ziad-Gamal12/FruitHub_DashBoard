import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomButton.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/addProductView.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/OrdersView.dart';

class DashboardviewBody extends StatelessWidget {
  const DashboardviewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Addproductview.routeName);
              },
              text: "Add Product"),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Ordersview.routeName);
              },
              text: "Orders"),
        ],
      ),
    );
  }
}
