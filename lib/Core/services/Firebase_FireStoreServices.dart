import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/Core/Entities/FireStoreRequirmentsEntity.dart';
import 'package:fruits_hub_dashboard/Core/errors/customExciption.dart';
import 'package:fruits_hub_dashboard/Core/services/CloudStoreServices.dart';

class FirebaseFirestoreservices implements Cloudstoreservices {
  final fireStore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
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

  @override
  Future getData({
    required FireStoreRequirmentsEntity requirements,
    Map<String, dynamic>? query,
  }) async {
    try {
      CollectionReference<Map<String, dynamic>> currentCollection =
          fireStore.collection(requirements.collection!);
      if (requirements.docId != null) {
        DocumentReference<Map<String, dynamic>> docRef =
            currentCollection.doc(requirements.docId!);
        if (requirements.subCollection != null) {
          currentCollection = docRef.collection(requirements.subCollection!);
          if (requirements.subDocId != null) {
            DocumentReference<Map<String, dynamic>> subDocRef =
                currentCollection.doc(requirements.subDocId!);

            if (requirements.subCollection2 != null) {
              currentCollection =
                  subDocRef.collection(requirements.subCollection2!);

              if (requirements.sub2DocId != null) {
                DocumentReference<Map<String, dynamic>> sub2DocRef =
                    currentCollection.doc(requirements.sub2DocId!);

                if (requirements.subCollection3 != null) {
                  currentCollection =
                      sub2DocRef.collection(requirements.subCollection3!);

                  if (requirements.sub3DocId != null) {
                    DocumentReference<Map<String, dynamic>> sub3DocRef =
                        currentCollection.doc(requirements.sub3DocId!);

                    if (requirements.subCollection4 != null) {
                      currentCollection =
                          sub3DocRef.collection(requirements.subCollection4!);

                      if (requirements.sub4DocId != null) {
                        final sub4DocRef =
                            currentCollection.doc(requirements.sub4DocId!);
                        final sub4DocSnapshot = await sub4DocRef.get();
                        return sub4DocSnapshot.data();
                      } else {
                        final sub4Snapshot = await currentCollection.get();
                        return sub4Snapshot.docs.map((e) => e.data()).toList();
                      }
                    } else {
                      final sub3DocSnapshot = await sub3DocRef.get();
                      return sub3DocSnapshot.data();
                    }
                  } else {
                    final sub3Snapshot = await currentCollection.get();
                    return sub3Snapshot.docs.map((e) => e.data()).toList();
                  }
                } else {
                  final sub2DocSnapshot = await sub2DocRef.get();
                  return sub2DocSnapshot.data();
                }
              } else {
                final sub2Snapshot = await currentCollection.get();
                return sub2Snapshot.docs.map((e) => e.data()).toList();
              }
            } else {
              final subDocSnapshot = await subDocRef.get();
              return subDocSnapshot.data();
            }
          } else {
            final subSnapshot = await currentCollection.get();
            return subSnapshot.docs.map((e) => e.data()).toList();
          }
        } else {
          final docSnapshot = await docRef.get();
          return docSnapshot.data();
        }
      } else {
        final querySnapshot = await currentCollection.get();
        return querySnapshot.docs.map((e) => e.data()).toList();
      }
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw Customexciption(
            message:
                "🚨 ليس لديك الإذن اللازم للوصول إلى البيانات. يرجى مراجعة صلاحياتك.",
          );
        case 'unavailable':
          throw Customexciption(
            message: "🚨 الخادم غير متوفر حاليا. حاول مرة أخرى لاحقا.",
          );
        case 'invalid-argument':
          throw Customexciption(
            message:
                "❌ تم تمرير بيانات غير صحيحة. تأكد من المدخلات وحاول مجددًا.",
          );
        case 'deadline-exceeded':
          throw Customexciption(
            message: "⏳ انتهت المهلة الزمنية للطلب. حاول مرة أخرى.",
          );
        case 'resource-exhausted':
          throw Customexciption(
            message: "🚨 تم استهلاك الموارد المتاحة. يرجى المحاولة لاحقًا.",
          );
        default:
          throw Customexciption(message: "❌ حدث خطأ غير متوقع.");
      }
    }
  }
}
