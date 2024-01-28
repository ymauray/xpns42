import 'package:flutter/material.dart';
import 'package:xpns42/models/ledger.dart';

class LedgerCard extends StatelessWidget {
  const LedgerCard({
    required this.ledger,
    required this.onDismissed,
    required this.onTap,
    required this.confirmDismiss,
    super.key,
  });

  final Ledger ledger;
  final Future<bool?> Function(DismissDirection) confirmDismiss;
  final void Function(DismissDirection) onDismissed;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 1),
        child: Dismissible(
          key: ValueKey(ledger.id),
          direction: DismissDirection.endToStart,
          confirmDismiss: confirmDismiss,
          background: const ColoredBox(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          onDismissed: onDismissed,
          child: Material(
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ledger.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '${ledger.firstPerson} et ${ledger.secondPerson}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
