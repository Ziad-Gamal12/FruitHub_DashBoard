// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Repos/OrdersRepo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final OrdersRepo ordersRepo;
  GetOrdersCubit({required this.ordersRepo}) : super(GetOrdersInitial());
  updateOrderStatus(
      {required String status, required OrderEntity order}) async {
    emit(UpdateOrdersLoading());
    final result =
        await ordersRepo.updateOrderStatus(status: status, order: order);
    result.fold(
        (failure) => emit(UpdateOrdersFailure(errmessage: failure.errmessage)),
        (success) => emit(UpdateOrdersSuccess()));
  }
}
