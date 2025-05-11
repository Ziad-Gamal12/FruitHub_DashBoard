import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/Utils/Backend_EndPoints.dart';
import 'package:fruits_hub_dashboard/Core/errors/customExciption.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';
import 'package:fruits_hub_dashboard/Core/services/CloudStoreServices.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Repos/OrdersRepo.dart';

class Ordersrepoimpl implements OrdersRepo {
  final Cloudstoreservices cloudstoreservices;
  Ordersrepoimpl({required this.cloudstoreservices});

  @override
  Future<Either<Failures, void>> updateOrderStatus(
      {required OrderEntity order, required String status}) async {
    try {
      await cloudstoreservices.updateDate(
          collectionKey: BackendEndpoints.updateOrder,
          doc: order.orderId,
          data: status,
          field: "status");
      return right(null);
    } on Customexciption catch (e) {
      return left(serverFalires(errmessage: e.message));
    } catch (e) {
      return left(serverFalires(errmessage: "something went wrong"));
    }
  }
}
