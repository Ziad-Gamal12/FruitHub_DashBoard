// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/Core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/Core/repos/porducts/products_repo.dart';
import 'package:fruits_hub_dashboard/Features/Products/domain/entities/addproduct_entitiy.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit({required this.imagesRepo, required this.productsRepo})
      : super(AddProductInitial());
  final ProductsRepo productsRepo;
  final ImagesRepo imagesRepo;
  Future<void> addProduct({required AddproductEntitiy product}) async {
    emit(AddProductLoading());
    final result = await imagesRepo.uploadImage(file: product.image);
    result.fold((failure) {
      emit(AddProductFailure(errmessage: failure.errmessage));
    }, (url) async {
      product.imageUrl = url;
      log(product.imageUrl!);
      log(url);
      final response = await productsRepo.addProduct(product: product);
      response.fold((failure) {
        emit(AddProductFailure(errmessage: failure.errmessage));
      }, (added) {
        emit(AddProductSuccess());
      });
    });
  }
}
