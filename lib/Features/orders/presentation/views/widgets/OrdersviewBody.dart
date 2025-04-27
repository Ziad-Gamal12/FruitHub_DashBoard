import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderDetails.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderFruitsItems.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderShipping.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrderItemOrderInfo.dart';

class OrdersviewBody extends StatelessWidget {
  const OrdersviewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 600,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
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
                    Expanded(child: Customorderitemorderfruitsitems())
                  ],
                )),
          ),
        )
      ],
    );
  }
}
