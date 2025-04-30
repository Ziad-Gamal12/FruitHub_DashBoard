// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Repos/OrdersRepo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final OrdersRepo ordersRepo;
  GetOrdersCubit({required this.ordersRepo}) : super(GetOrdersInitial());
  void getOrders() async {
    emit(GetOrdersLoading());
    final result = await ordersRepo.getOrders();
    result.fold((failure) {
      emit(GetOrdersFailure(errmessage: failure.errmessage));
    }, (orders) {
      emit(GetOrdersSuccess(orders: orders));
    });
  }
}
