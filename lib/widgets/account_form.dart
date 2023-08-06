import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

class AccountForm extends ConsumerWidget {
  const AccountForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PaddedRow(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                ),
              ),
            ),
            PaddedRow(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'First person',
                ),
              ),
            ),
            PaddedRow(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Second person',
                ),
              ),
            ),
            PaddedRow(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(context.t.addAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaddedRow extends ConsumerWidget {
  const PaddedRow({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(child: Container()),
          Expanded(flex: 4, child: child),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
