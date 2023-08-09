import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/widgets/account_form.dart';

class NewAccountDialog extends ConsumerWidget {
  const NewAccountDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: Text(
        context.t.addAccount,
        textAlign: TextAlign.center,
      ),
      children: const [
        Divider(),
        AccountForm(),
      ],
    );
  }
}
