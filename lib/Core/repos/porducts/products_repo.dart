import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';
import 'package:fruits_hub_dashboard/Features/Products/domain/entities/addproduct_entitiy.dart';

abstract class ProductsRepo {
  Future<Either<Failures, void>> addProduct(
      {required AddproductEntitiy product});
}
