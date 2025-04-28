import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/CustomOrderItemOrderFruitItem.dart';

class Customorderitemorderfruitsitems extends StatelessWidget {
  const Customorderitemorderfruitsitems({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        CustomOrderIteFruitItem(
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/fruithub-973f6.appspot.com/o/bestSellerItem_test2.png?alt=media&token=e46ab999-ce2f-46be-ab4a-6f50671db7af",
          quantaty: "5",
        ),
        SizedBox(
          width: 10,
        ),
        CustomOrderIteFruitItem(
          imageUrl:
              "https://firebasestorage.googleapis.com/v0/b/fruithub-973f6.appspot.com/o/bestSellerItem_test2.png?alt=media&token=e46ab999-ce2f-46be-ab4a-6f50671db7af",
          quantaty: "5",
        )
      ]),
    );
  }
}
