import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/Core/services/CloudStoreServices.dart';

class FirebaseFirestoreservices implements Cloudstoreservices {
  final fireStore = FirebaseFirestore.instance;
  @override
  Future<void> addProduct(
      {required String path,
      required Map<String, dynamic> data,
      required String docid}) async {
    await fireStore.collection(path).doc(docid).set(data);
  }

  @override
  Future<bool> isExsists({required String path, required String docid}) {
    return fireStore
        .collection(path)
        .doc(docid)
        .get()
        .then((value) => value.exists);
  }
}
