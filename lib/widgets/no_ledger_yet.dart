import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

class NoLedgerYet extends ConsumerWidget {
  const NoLedgerYet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(context.t.noLedgerYet),
    );
  }
}
