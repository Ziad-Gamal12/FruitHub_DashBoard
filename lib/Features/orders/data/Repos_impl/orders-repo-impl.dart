import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:fruits_hub_dashboard/Core/Utils/Backend_EndPoints.dart';
import 'package:fruits_hub_dashboard/Core/errors/customExciption.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';
import 'package:fruits_hub_dashboard/Core/services/CloudStoreServices.dart';
import 'package:fruits_hub_dashboard/Features/orders/data/Models/OrderItemModel.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Repos/OrdersRepo.dart';

class Ordersrepoimpl implements OrdersRepo {
  final Cloudstoreservices cloudstoreservices;
  Ordersrepoimpl({required this.cloudstoreservices});
  @override
  Future<Either<Failures, List<OrderEntity>>> getOrders() async {
    try {
      final List<Map<String, dynamic>> orders =
          await cloudstoreservices.getData(
        requirements: FireStoreRequirmentsEntity(
          collection: BackendEndpoints.getOrders,
        ),
      );
      return right(orders
          .map((e) => OrderItemModel.fromJson(json: e).toEntity())
          .toList());
    } on Customexciption catch (e) {
      return left(serverFalires.fromfirebase(e.toString()));
    } catch (e) {
      return left(serverFalires.fromfirebase(e.toString()));
    }
  }
}
