import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class CustomOrderIteFruitItem extends StatelessWidget {
  const CustomOrderIteFruitItem(
      {super.key, required this.quantaty, required this.imageUrl});
  final String quantaty;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const Divider(
              height: 0,
              color: Colors.grey,
            ),
            Text(
              quantaty,
              style: textStyles.textstyle16.copyWith(color: Colors.black),
            ),
            const Divider(
              height: 10,
              color: Colors.grey,
            ),
            Text(
              "Quantaty",
              style: textStyles.textstyle13.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
