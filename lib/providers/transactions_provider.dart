import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/transaction.dart';

part 'transactions_provider.g.dart';

@riverpod
class Transactions extends _$Transactions {
  @override
  FutureOr<List<Transaction>> build(String groupId) {
    return [];
  }
}
