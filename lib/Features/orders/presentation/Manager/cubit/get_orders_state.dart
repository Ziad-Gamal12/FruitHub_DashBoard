part of 'get_orders_cubit.dart';

@immutable
sealed class GetOrdersState {}

final class GetOrdersInitial extends GetOrdersState {}

final class UpdateOrdersLoading extends GetOrdersState {}

final class UpdateOrdersSuccess extends GetOrdersState {}

final class UpdateOrdersFailure extends GetOrdersState {
  final String errmessage;
  UpdateOrdersFailure({required this.errmessage});
}
