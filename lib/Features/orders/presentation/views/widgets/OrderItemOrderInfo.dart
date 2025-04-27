import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';

class OrderItemOrderInfo extends StatelessWidget {
  const OrderItemOrderInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Rowinfo(title: "ID", value: "2532545151321"),
            const Spacer(),
            Rowinfo(title: "Status", value: "Pending"),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Rowinfo(title: "Created At", value: "01/01/2023"),
      ],
    );
  }
}
