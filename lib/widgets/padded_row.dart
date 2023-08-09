import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
