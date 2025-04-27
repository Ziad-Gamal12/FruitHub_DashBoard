import 'dart:developer';
import 'dart:io';

import 'package:fruits_hub_dashboard/Core/services/Storage_Services.dart';
import 'package:fruits_hub_dashboard/constent.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Supabasestorageservices implements StorageServices {
  static const fruitsImagesBucketname = "fruitsimages";
  static late Supabase supabase;
  static initSupabase() async {
    supabase = await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  @override
  Future<String> uploadFile({required File file}) async {
    try {
      final path = basename(file.path);
      await supabase.client.storage
          .from(fruitsImagesBucketname)
          .upload("images/$path", file);
      String url = getfileUrl(
          bucketname: fruitsImagesBucketname, filepath: "images/$path");
      return url;
    } catch (e) {
      log("exeption from supabase storage service with upload file method and the problem is ${e.toString()}");
      return e.toString();
    }
  }

  getfileUrl({required String bucketname, required String filepath}) {
    String url =
        supabase.client.storage.from(bucketname).getPublicUrl(filepath);
    return url;
  }
}
