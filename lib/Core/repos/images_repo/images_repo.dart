import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/Core/errors/customFailure.dart';

abstract class ImagesRepo {
  Future<Either<Failures, String>> uploadImage({required File file});
}
