import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:study_riverpod/step_17/model/firestore_item.dart';

part 'firestore_controller.g.dart';

/// Firestoreを扱うコントローラ
@Riverpod(keepAlive: false)
class FirestoreController extends _$FirestoreController {
  final _firestore = FirebaseFirestore.instance;

  @override
  Stream<List<FirestoreItem>> build() {
    return _firestore.collection('collectionPath').snapshots().map(
          (event) =>
              event.docs.map((e) => FirestoreItem.fromJson(e.data())).toList(),
        );
  }
}
