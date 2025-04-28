import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderProductEntity.dart';

class OrderProductModel {
  final String code, imageUrl, name;
  final int price, quantity;

  OrderProductModel(
      {required this.code,
      required this.imageUrl,
      required this.name,
      required this.price,
      required this.quantity});

  factory OrderProductModel.formJson({required Map<String, dynamic> json}) {
    return OrderProductModel(
        code: json["code"],
        imageUrl: json["image"],
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"]);
  }
  factory OrderProductModel.fromEntity({required Orderproductentity entity}) {
    return OrderProductModel(
        code: entity.code,
        imageUrl: entity.imageUrl,
        name: entity.name,
        price: entity.price,
        quantity: entity.quantity);
  }
  Orderproductentity toEntity() {
    return Orderproductentity(
        code: code,
        name: name,
        price: price,
        quantity: quantity,
        imageUrl: imageUrl);
  }

  Map<String, dynamic> toJson() {
    return {
      "code": code,
      "price": price,
      "quantity": quantity,
      "name": name,
      "image": imageUrl
    };
  }
}
