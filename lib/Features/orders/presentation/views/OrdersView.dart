import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/Core/Utils/get_it.dart';
import 'package:fruits_hub_dashboard/Core/widgets/CustomAppBar.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Repos/OrdersRepo.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/Manager/cubit/get_orders_cubit.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrdersviewBody.dart';

class Ordersview extends StatelessWidget {
  const Ordersview({super.key});
  static const routeName = "OrdersView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetOrdersCubit(
        ordersRepo: getIt<OrdersRepo>(),
      ),
      child: const Scaffold(
        appBar: CustomAppBar(appBartitle: "Orders"),
        body: OrdersviewBody(),
      ),
    );
  }
}
