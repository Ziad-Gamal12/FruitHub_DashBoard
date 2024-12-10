// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/addProductView.dart';
import 'package:fruits_hub_dashboard/Features/dashboard/presentation/views/dashboardView.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Dashboardview.routeName:
      return MaterialPageRoute(builder: (context) => const Dashboardview());
    case Addproductview.routeName:
      return MaterialPageRoute(builder: (context) => const Addproductview());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
