import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class AddproductviewAppbar extends AppBar {
  AddproductviewAppbar({Key? key})
      : super(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Add Product",
            style: textStyles.textstyle19,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.menu),
            )
          ],
        );
}
