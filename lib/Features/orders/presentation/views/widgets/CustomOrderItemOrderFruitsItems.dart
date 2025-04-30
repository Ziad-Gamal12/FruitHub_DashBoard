import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fruits_hub_dashboard/Core/widgets/fruit_item.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderProductEntity.dart';
import 'package:provider/provider.dart';

class Customorderitemorderfruitsitems extends StatelessWidget {
  const Customorderitemorderfruitsitems({super.key});

  @override
  Widget build(BuildContext context) {
    List<Orderproductentity> orderProducts =
        context.read<OrderEntity>().orderProducts;

    return IntrinsicHeight(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: orderProducts
                .asMap()
                .entries
                .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Animate(effects: [
                      FadeEffect(duration: 500.ms),
                      SlideEffect(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                        delay: (100 * e.key).ms, // stagger animation
                      ),
                    ], child: fruit_item(product: e.value))))
                .toList()),
      ),
    );
  }
}
