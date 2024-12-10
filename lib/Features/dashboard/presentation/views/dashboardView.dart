import 'package:flutter/material.dart';

import 'package:fruits_hub_dashboard/Features/dashboard/presentation/views/widgets/DashboardViewAppBar.dart';
import 'package:fruits_hub_dashboard/Features/dashboard/presentation/views/widgets/DashboardviewBody.dart';

class Dashboardview extends StatelessWidget {
  const Dashboardview({super.key});
  static const routeName = 'dashboardview';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardViewAppBar(),
      body: DashboardviewBody(),
    );
  }
}
