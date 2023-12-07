import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/models/ledger.dart';
import 'package:xpns42/widgets/ledger_password_form.dart';

class LedgerPasswordDialog extends ConsumerWidget {
  const LedgerPasswordDialog(this.ledgerProxy, {super.key});

  final Ledger ledgerProxy;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: Text(
        context.t.ledgerPassword,
        textAlign: TextAlign.center,
      ),
      children: [
        const Divider(),
        LedgerPasswordForm(ledgerProxy),
      ],
    );
  }
}
