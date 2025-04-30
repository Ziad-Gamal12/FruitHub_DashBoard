import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/Features/orders/data/Models/OrderProductModel.dart';
import 'package:fruits_hub_dashboard/Features/orders/data/Models/OrderShippingModel.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';

class OrderItemModel {
  final String paymentMethod, status, orderID;
  final DateTime createdAt;
  final List<Map<String, dynamic>> orderProducts;
  final Map<String, dynamic> orderShippingEntity;

  OrderItemModel(
      {required this.paymentMethod,
      required this.status,
      required this.orderID,
      required this.createdAt,
      required this.orderProducts,
      required this.orderShippingEntity});

  factory OrderItemModel.fromJson({required Map<String, dynamic> json}) {
    return OrderItemModel(
      status: json["status"],
      orderID: json["id"],
      createdAt: (json["createdAt"] as Timestamp).toDate(),
      paymentMethod: json["paymentMethod"],
      orderProducts: (json["ordersProducts"] as List)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      orderShippingEntity: json["shippingaddressmodel"],
    );
  }

  factory OrderItemModel.fromEntity({required OrderEntity entity}) {
    return OrderItemModel(
      paymentMethod: entity.paymentMethod,
      createdAt: entity.createdAt,
      orderID: entity.orderId,
      status: entity.orderStatus,
      orderProducts: entity.orderProducts
          .map((e) => OrderProductModel.fromEntity(entity: e).toJson())
          .toList(),
      orderShippingEntity:
          OrderShippingModel.fromEntity(entity: entity.orderShippingEntity)
              .toJson(),
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
        createdAt: createdAt,
        orderId: orderID,
        orderStatus: status,
        paymentMethod: paymentMethod,
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
      "status": status,
      "id": orderID,
      "createdAt": createdAt
    };
  }
}
