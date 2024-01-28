import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/group.dart';
import 'package:xpns42/repositories/group_repository.dart';

part 'groups_provider.g.dart';

@riverpod
class Groups extends _$Groups {
  @override
  FutureOr<List<Group>> build() async {
    return await GroupRepository.listGroups();
  }

  FutureOr<void> createGroup({required String name}) async {
    await GroupRepository.createGroup(name: name);
    state = await AsyncValue.guard(GroupRepository.listGroups);
  }
}
