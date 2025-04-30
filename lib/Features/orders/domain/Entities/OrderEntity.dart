import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderProductEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderShippingEntity.dart';

class OrderEntity {
  final String paymentMethod, orderId, orderStatus;
  final DateTime createdAt;

  final List<Orderproductentity> orderProducts;
  final OrderShippingEntity orderShippingEntity;

  OrderEntity(
      {required this.paymentMethod,
      required this.createdAt,
      required this.orderId,
      required this.orderStatus,
      required this.orderProducts,
      required this.orderShippingEntity});
}
