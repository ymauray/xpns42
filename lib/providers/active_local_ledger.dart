import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:xpns42/models/local_ledger.dart';

part 'active_local_ledger.g.dart';

@Riverpod(keepAlive: true)
class ActiveLocalLedger extends _$ActiveLocalLedger {
  @override
  LocalLedger? build() {
    return null;
  }

  // ignore: use_setters_to_change_properties
  void set(LocalLedger? localLedger) {
    state = localLedger;
  }
}
