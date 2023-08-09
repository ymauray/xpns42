import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/account_proxy.dart';
import 'package:xpns42/repositories/account_repository.dart';

part 'account_list_provider.g.dart';

@riverpod
class AccountList extends _$AccountList {
  @override
  FutureOr<List<AccountProxy>> build() async {
    return await ref.read(accountProvider).loadAccounts();
  }

  FutureOr<void> refresh(List<AccountProxy> proxies) async =>
      state = AsyncValue.data(proxies);
}
