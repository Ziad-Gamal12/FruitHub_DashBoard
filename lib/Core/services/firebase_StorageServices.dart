import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/Core/errors/customExciption.dart';
import 'package:fruits_hub_dashboard/Core/services/Storage_Services.dart';
import 'package:path/path.dart';

class FirebaseStorageservices implements StorageServices {
  final _Storage = FirebaseStorage.instance;
  @override
  Future<String> uploadFile({required File file}) async {
    try {
      final path = basename(file.path);
      final fileRef = _Storage.ref().child(path);
      await fileRef.putFile(file);
      return await fileRef.getDownloadURL();
    } on FirebaseException catch (e) {
      log("exception from firebaseStorageServices & error is $e and the error and the code is ${e.code}");
      if (e.code == 'permission-denied') {
        throw Customexciption(message: 'permission-denied');
      } else if (e.code == 'too-many-requests') {
        throw Customexciption(message: 'too-many-requests');
      } else if (e.code == 'unauthorized') {
        throw Customexciption(message: 'unauthorized');
      } else if (e.code == 'unknown') {
        throw Customexciption(message: 'unknown');
      } else {
        throw Customexciption(message: 'unExpected error');
      }
    } catch (e) {
      log("exception from firebaseStorageServices & error is $e and the error");
      throw Customexciption(message: 'unExpected error');
    }
  }
}
