// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/Features/Products/presentation/views/addProductView.dart';
import 'package:fruits_hub_dashboard/Features/dashboard/presentation/views/dashboardView.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/OrdersView.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Dashboardview.routeName:
      return MaterialPageRoute(builder: (context) => const Dashboardview());
    case Addproductview.routeName:
      return MaterialPageRoute(builder: (context) => const Addproductview());
    case Ordersview.routeName:
      return MaterialPageRoute(builder: (context) => const Ordersview());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
