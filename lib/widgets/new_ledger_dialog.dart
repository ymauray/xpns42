import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/new_ledger_form.dart';

class NewLedgerDialog extends ConsumerWidget {
  const NewLedgerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: Text(
        context.t.addLedger,
        textAlign: TextAlign.center,
      ),
      children: const [
        Divider(),
        NewLedgerForm(),
      ],
    );
  }
}
