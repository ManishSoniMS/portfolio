import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'registered_modules.g.dart';

@riverpod
FirebaseFirestore firestore(Ref ref) => FirebaseFirestore.instance;
