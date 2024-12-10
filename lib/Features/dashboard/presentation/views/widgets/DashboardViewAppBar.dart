import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';

class DashboardViewAppBar extends AppBar {
  DashboardViewAppBar({Key? key})
      : super(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Dashboard",
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
