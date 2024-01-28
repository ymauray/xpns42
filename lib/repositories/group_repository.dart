import 'package:pocketbase/pocketbase.dart';
import 'package:xpns42/models/group.dart';
import 'package:xpns42/pocketbase_util.dart';
import 'package:xpns42/repositories/base_repository.dart';

class GroupRepository extends BaseRepository {
  static Future<Group?> createGroup({
    required String name,
  }) async {
    final userCredential = pocketBaseInstance.authStore.model as RecordModel;
    final newGroup = await pocketBaseInstance.collection('groups').create(
      body: {
        'uid': userCredential.id,
      },
    );
    final key = newGroup.id;
    final group = Group(name: name, id: key);

    final encryptedData = BaseRepository.encrypt(key, group.toJson());
    await pocketBaseInstance.collection('groups').update(
      key,
      body: {
        'encoded': BaseRepository.bin2hex(encryptedData),
      },
    );

    return group;
  }

  static Future<List<Group>> listGroups() async {
    final groups = <Group>[];

    final records = await pocketBaseInstance.collection('groups').getFullList();
    for (final record in records) {
      final encryptedData =
          BaseRepository.hex2bin(record.data['encoded'] as String);
      final decryptedData = BaseRepository.decrypt(record.id, encryptedData);
      final group = Group.fromJson(decryptedData);
      groups.add(group);
    }

    return groups;
  }
}
