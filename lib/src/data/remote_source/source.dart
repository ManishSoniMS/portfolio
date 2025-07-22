import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/constants/api_constants.dart';
import '../../domain/DTOs/query_dto.dart';
import '../../domain/DTOs/user_dto.dart';
import '../../external/registered_modules.dart';

part 'source.g.dart';

abstract class Source {
  Future<String> createUser(UserDTO dto);

  Future<void> createQuery(QueryDTO dto);
}

class SourceImpl extends Source {
  SourceImpl(this._db);

  final FirebaseFirestore _db;

  @override
  Future<String> createUser(UserDTO dto) async {
    final collectionRef = _db.collection(Collection.users);

    final task1 =
        await collectionRef.where('email', isEqualTo: dto.email).get();

    if (task1.docs.isNotEmpty) {
      return task1.docs.first.id;
    }

    final docId = collectionRef.doc().id;
    await collectionRef.add({...dto.toMap(), 'id': docId});
    return docId;
  }

  @override
  Future<void> createQuery(QueryDTO dto) async {
    final collectionRef = _db.collection(Collection.queries);
    final docId = collectionRef.doc().id;
    await collectionRef.add({...dto.toMap(), 'id': docId});
  }
}

@riverpod
Source source(Ref ref) {
  final db = ref.watch(firestoreProvider);
  return SourceImpl(db);
}
