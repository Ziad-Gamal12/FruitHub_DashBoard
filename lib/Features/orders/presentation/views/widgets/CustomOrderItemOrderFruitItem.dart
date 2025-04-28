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
    return Container(
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
            height: 4,
            color: Colors.black,
          ),
          Text(
            quantaty,
            style: textStyles.textstyle19.copyWith(color: Colors.black),
          ),
          const Divider(
            height: 4,
            color: Colors.black,
          ),
          Text(
            "Quantaty",
            style: textStyles.textstyle13.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
