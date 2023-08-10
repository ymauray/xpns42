import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LowerDivider extends ConsumerWidget {
  const LowerDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(top: 24),
      child: Divider(
        height: 0,
        thickness: 1,
        color: Colors.white38,
      ),
    );
  }
}
