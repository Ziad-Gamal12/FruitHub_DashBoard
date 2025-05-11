import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<void> updateDate({
    required String collectionKey,
    required doc,
    required dynamic data,
    required String field,
  });
  Future<bool> isExsists({required String path, required String docid});
  Future<Stream<QuerySnapshot>> getQueryStream(
      {required FireStoreRequirmentsEntity requirements});
}
