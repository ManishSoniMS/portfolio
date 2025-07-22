import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/remote_source/source.dart';
import '../domain/DTOs/query_dto.dart';
import '../domain/DTOs/user_dto.dart';

part 'query_controller.g.dart';

@riverpod
class QueryController extends _$QueryController {
  @override
  Future<void> build() async {
    return;
  }

  Future<void> createQuery(QueryDTO dto) async {
    state = const AsyncLoading();
    try {
      final source = ref.read(sourceProvider);
      final userId =
          await source.createUser(UserDTO(name: dto.name, email: dto.email));

      await source.createQuery(dto.copyWith(userId: userId));
      state = const AsyncData(null);
    } catch (e, s) {
      state = AsyncError(e, s);
    }
  }
}
