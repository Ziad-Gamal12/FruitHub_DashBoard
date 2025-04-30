import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/Manager/cubit/get_orders_cubit.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/views/widgets/OrdersListView.dart';

class OrdersviewBody extends StatefulWidget {
  const OrdersviewBody({super.key});

  @override
  State<OrdersviewBody> createState() => _OrdersviewBodyState();
}

class _OrdersviewBodyState extends State<OrdersviewBody> {
  @override
  void initState() {
    if (mounted) {
      context.read<GetOrdersCubit>().getOrders();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrdersCubit, GetOrdersState>(
      builder: (context, state) {
        if (state is GetOrdersFailure) {
          return Center(
              child: Text(
            "Failed to load orders",
            style: textStyles.textstyle19.copyWith(color: Colors.red),
          ));
        } else if (state is GetOrdersLoading) {
          const Orderslistview(
            orders: [],
          );
        } else if (state is GetOrdersSuccess) {
          return Orderslistview(
            orders: state.orders,
          );
        }

        return const SizedBox();
      },
    );
  }
}
