import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderShippingEntity.dart';

class OrderShippingModel {
  final String address, city, email, flat, fullname, phoneNumber;

  OrderShippingModel(
      {required this.address,
      required this.city,
      required this.email,
      required this.flat,
      required this.fullname,
      required this.phoneNumber});
  factory OrderShippingModel.fromJson({required Map<String, dynamic> json}) {
    return OrderShippingModel(
        address: json["address"],
        city: json["city"],
        email: json["email"],
        flat: json["flatNumber"],
        fullname: json["fullname"],
        phoneNumber: json["phoneNumber"]);
  }
  factory OrderShippingModel.fromEntity({required OrderShippingEntity entity}) {
    return OrderShippingModel(
        address: entity.address,
        city: entity.city,
        email: entity.email,
        flat: entity.flat,
        fullname: entity.fullname,
        phoneNumber: entity.phoneNumber);
  }

  OrderShippingEntity toEntity() {
    return OrderShippingEntity(
        address: address,
        city: city,
        email: email,
        flat: flat,
        fullname: fullname,
        phoneNumber: phoneNumber);
  }

  Map<String, dynamic> toJson() {
    return {
      "address": address,
      "city": city,
      "email": email,
      "flatNumber": flat,
      "fullname": fullname,
      "phoneNumber": phoneNumber
    };
  }
}
