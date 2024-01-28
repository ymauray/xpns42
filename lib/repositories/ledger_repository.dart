import 'package:pocketbase/pocketbase.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/pocketbase_util.dart';
import 'package:xpns42/repositories/base_repository.dart';

class LedgerRepository extends BaseRepository {
  // createLedger
  static Future<Ledger?> createLedger({
    required String title,
    required String groupId,
    required String firstPerson,
    required String secondPerson,
  }) async {
    final userCredential = pocketBaseInstance.authStore.model as RecordModel;
    final newLedger = await pocketBaseInstance.collection('ledgers').create(
      body: {
        'uid': userCredential.id,
      },
    );
    final key = newLedger.id;
    final ledger = Ledger(
      title: title,
      id: key,
      firstPerson: firstPerson,
      secondPerson: secondPerson,
    );

    final encryptedData = BaseRepository.encrypt(key, ledger.toJson());
    await pocketBaseInstance.collection('ledgers').update(
      key,
      body: {
        'encoded': BaseRepository.bin2hex(encryptedData),
      },
    );

    await pocketBaseInstance.collection('ledgersrefs').create(
      body: {
        'uid': userCredential.id,
        'gid': groupId,
        'lid': key,
      },
    );

    return ledger;
  }

  // listLedgers
  static Future<List<Ledger>> listLedgers(String groupId) async {
    final ledgers = <Ledger>[];

    final records =
        await pocketBaseInstance.collection('ledgersrefs').getFullList(
              filter: pocketBaseInstance.filter(
                'gid = {:gid}',
                {'gid': groupId},
              ),
            );
    for (final record in records) {
      final ledgerId = record.data['lid'] as String;
      final ledgerRecord =
          await pocketBaseInstance.collection('ledgers').getOne(ledgerId);
      final encryptedData =
          BaseRepository.hex2bin(ledgerRecord.data['encoded'] as String);
      final decryptedData = BaseRepository.decrypt(
        ledgerRecord.id,
        encryptedData,
      );
      final ledger = Ledger.fromJson(decryptedData);
      ledgers.add(ledger);
    }
    ledgers.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

    return ledgers;
  }

  // updateLedger
  static Future<void> updateLedger(Ledger ledger) async {
    final encryptedData = BaseRepository.encrypt(ledger.id, ledger.toJson());
    await pocketBaseInstance.collection('ledgers').update(
      ledger.id,
      body: {
        'encoded': BaseRepository.bin2hex(encryptedData),
      },
    );
  }

  // deleteLedger
  static Future<void> deleteLedger(Ledger ledger) async {
    await pocketBaseInstance.collection('ledgers').delete(ledger.id);
  }
}
