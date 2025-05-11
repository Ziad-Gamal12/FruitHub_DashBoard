import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/Core/Utils/App_Colors.dart';
import 'package:fruits_hub_dashboard/Core/Utils/textStyles.dart';
import 'package:fruits_hub_dashboard/Core/helper_funcition/ShowSnakBar.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/presentation/Manager/cubit/get_orders_cubit.dart';

class UpdateOrderStatusTextWidget extends StatelessWidget {
  const UpdateOrderStatusTextWidget({
    super.key,
    required this.status,
    required this.order,
  });

  final String status;
  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetOrdersCubit, GetOrdersState>(
      listener: (context, state) {
        if (state is UpdateOrdersSuccess) {
          showSnackBar(context: context, message: "Order Status Updated");
        } else if (state is UpdateOrdersFailure) {
          showSnackBar(context: context, message: state.errmessage);
        }
      },
      builder: (context, state) {
        return state is UpdateOrdersLoading
            ? const CircularProgressIndicator()
            : Visibility(
                visible:
                    status.toLowerCase() != order.orderStatus.toLowerCase(),
                child: InkWell(
                  onTap: () {
                    context.read<GetOrdersCubit>().updateOrderStatus(
                        order: order, status: status.toLowerCase());
                  },
                  child: Text("Upadte",
                      style: textStyles.textstyle16
                          .copyWith(color: AppColors.MainColor)),
                ),
              );
      },
    );
  }
}
