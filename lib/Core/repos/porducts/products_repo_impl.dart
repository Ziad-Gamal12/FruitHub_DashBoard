import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/Utils/Backend_EndPoints.dart';
import 'package:fruits_hub_dashboard/Core/errors/customExciption.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';
import 'package:fruits_hub_dashboard/Core/repos/porducts/products_repo.dart';
import 'package:fruits_hub_dashboard/Core/services/CloudStoreServices.dart';
import 'package:fruits_hub_dashboard/Features/Products/data/models/addProductModel.dart';
import 'package:fruits_hub_dashboard/Features/Products/domain/entities/addproduct_entitiy.dart';

class ProductsRepoImpl implements ProductsRepo {
  final Cloudstoreservices firebaseFireStoreServices;

  const ProductsRepoImpl({required this.firebaseFireStoreServices});
  @override
  Future<Either<Failures, void>> addProduct(
      {required AddproductEntitiy product}) async {
    try {
      var productdata = Addproductmodel.fromEntity(addproductEntity: product);
      bool isProductExsists = await firebaseFireStoreServices.isExsists(
          path: BackendEndpoints.addProduct,
          docid: productdata.code.toLowerCase());

      if (isProductExsists == false) {
        await firebaseFireStoreServices.addProduct(
            path: BackendEndpoints.addProduct,
            data: productdata.toMap(),
            docid: productdata.code.toLowerCase());
      } else {
        throw Customexciption(message: 'Product Already Exsists');
      }

      return right(null);
    } on Customexciption catch (e) {
      log("exception from productsRepoImpl & error is $e and the error is ${e.toString()}");
      return left(serverFalires.fromfirebase(e.toString()));
    } catch (e) {
      log("exception from productsRepoImpl & error is $e and the error is ${e.toString()}");
      return left(serverFalires.fromfirebase(e.toString()));
    }
  }
}
