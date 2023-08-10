import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/import_ledger_form.dart';

class ImportLedgerDialog extends ConsumerWidget {
  const ImportLedgerDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: Text(
        context.t.importALedger,
        textAlign: TextAlign.center,
      ),
      children: const [
        Divider(
          thickness: 1,
          color: Colors.white38,
        ),
        ImportLedgerForm(),
      ],
    );
  }
}
