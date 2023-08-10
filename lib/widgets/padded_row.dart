import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaddedRow extends ConsumerWidget {
  const PaddedRow({
    required this.child,
    this.top = 16,
    super.key,
  });

  final Widget child;
  final double top;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(top: top),
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
