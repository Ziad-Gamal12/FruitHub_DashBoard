import 'package:fruits_hub_dashboard/Features/orders/data/Models/OrderProductModel.dart';
import 'package:fruits_hub_dashboard/Features/orders/data/Models/OrderShippingModel.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';

class OrderItemModel {
  final String paymentMethod, uID;
  final List<Map<String, dynamic>> orderProducts;
  final Map<String, dynamic> orderShippingEntity;

  OrderItemModel(
      {required this.paymentMethod,
      required this.uID,
      required this.orderProducts,
      required this.orderShippingEntity});

  factory OrderItemModel.fromJson({required Map<String, dynamic> json}) {
    return OrderItemModel(
        paymentMethod: json["paymentMethod"],
        orderProducts: (json["ordersProducts"] as List)
            .map((e) => e as Map<String, dynamic>)
            .toList(),
        orderShippingEntity: json["shippingaddressmodel"],
        uID: json["uid"]);
  }

  factory OrderItemModel.fromEntity({required OrderEntity entity}) {
    return OrderItemModel(
        paymentMethod: entity.paymentMethod,
        orderProducts: entity.orderProducts
            .map((e) => OrderProductModel.fromEntity(entity: e).toJson())
            .toList(),
        orderShippingEntity:
            OrderShippingModel.fromEntity(entity: entity.orderShippingEntity)
                .toJson(),
        uID: entity.uID);
  }

  OrderEntity toEntity() {
    return OrderEntity(
        paymentMethod: paymentMethod,
        uID: uID,
        orderProducts: orderProducts
            .map((e) => OrderProductModel.formJson(json: e).toEntity())
            .toList(),
        orderShippingEntity:
            OrderShippingModel.fromJson(json: orderShippingEntity).toEntity());
  }

  Map<String, dynamic> toJson() {
    return {
      "paymentMethod": paymentMethod,
      "ordersProducts": orderProducts,
      "shippingaddressmodel": orderShippingEntity,
      "uid": uID
    };
  }
}
