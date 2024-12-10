abstract class Cloudstoreservices {
  Future<void> addProduct(
      {required String path,
      required Map<String, dynamic> data,
      required String docid});
  Future<bool> isExsists({required String path, required String docid});
}
