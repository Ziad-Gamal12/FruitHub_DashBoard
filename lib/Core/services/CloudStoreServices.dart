import 'package:fruits_hub_dashboard/Core/Entities/FireStoreRequirmentsEntity.dart';

abstract class Cloudstoreservices {
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      required String docid});

  Future getData({
    required FireStoreRequirmentsEntity requirements,
    Map<String, dynamic>? query,
  });
  Future<bool> isExsists({required String path, required String docid});
}
