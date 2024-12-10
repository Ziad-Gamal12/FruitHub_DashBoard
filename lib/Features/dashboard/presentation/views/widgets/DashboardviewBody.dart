import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomButton.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/addProductView.dart';

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
              text: "add product")
        ],
      ),
    );
  }
}
