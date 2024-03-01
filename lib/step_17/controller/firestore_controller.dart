import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_controller.g.dart';

/// Firestoreを扱うコントローラ
@Riverpod(keepAlive: true)
class FirestoreController extends _$FirestoreController {
  final _firestore = FirebaseFirestore.instance;

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> build() {
    return _firestore.collection('collectionPath').snapshots();
  }
}
