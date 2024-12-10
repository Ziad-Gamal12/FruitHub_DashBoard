import 'package:fruits_hub_dashboard/Core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/Core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/Core/repos/porducts/products_repo.dart';
import 'package:fruits_hub_dashboard/Core/repos/porducts/products_repo_impl.dart';
import 'package:fruits_hub_dashboard/Core/services/Firebase_FireStoreServices.dart';
import 'package:fruits_hub_dashboard/Core/services/firebase_StorageServices.dart';
import 'package:fruits_hub_dashboard/Core/services/supabaseStorageServices.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup_getit() {
  getIt.registerSingleton<FirebaseStorageservices>(FirebaseStorageservices());
  getIt.registerSingleton<FirebaseFirestoreservices>(
      FirebaseFirestoreservices());
  getIt.registerSingleton<ImagesRepo>(
      ImagesRepoImpl(firebaseStorageservices: Supabasestorageservices()));
  getIt.registerSingleton<ProductsRepo>(ProductsRepoImpl(
      firebaseFireStoreServices: getIt<FirebaseFirestoreservices>()));
}
