// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';
import 'package:fruits_hub_dashboard/Features/orders/domain/Entities/OrderEntity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, List<OrderEntity>>> getOrders();
}
