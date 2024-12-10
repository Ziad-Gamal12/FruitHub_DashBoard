import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/errors/customExciption.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';
import 'package:fruits_hub_dashboard/Core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/Core/services/Storage_Services.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageServices firebaseStorageservices;
  ImagesRepoImpl({required this.firebaseStorageservices});
  @override
  Future<Either<Failures, String>> uploadImage({required File file}) async {
    try {
      final String imagePath =
          await firebaseStorageservices.uploadFile(file: file);

      return right(imagePath);
    } on Customexciption catch (e) {
      return left(serverFalires(errmessage: e.message));
    }
  }
}
