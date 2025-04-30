// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/widgets/rowInfo.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderProductEntity.dart';

class fruit_item extends StatelessWidget {
  const fruit_item({super.key, required this.product});
  final Orderproductentity product;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 280,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(255, 207, 207, 207),
          blurRadius: 12,
          offset: Offset(0, 30),
          spreadRadius: 0,
        )
      ], borderRadius: BorderRadius.circular(10), color: Colors.grey.shade200),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 1,
                child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Rowinfo(
                  title: "Code",
                  value: product.code,
                  isSpaced: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Rowinfo(
                  title: "Name",
                  value: product.name,
                  isSpaced: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Rowinfo(
                  title: "Quantity",
                  value: product.quantity > 1
                      ? "${product.quantity} Items"
                      : "${product.quantity} Item",
                  isSpaced: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                const SizedBox(
                  height: 4,
                ),
                Rowinfo(
                  title: "Price/Kg",
                  value: "${product.price}/جنية",
                  isSpaced: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
