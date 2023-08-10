import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TitleDivider extends ConsumerWidget {
  const TitleDivider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Divider(
        height: 0,
        thickness: 1,
        color: Colors.white38,
      ),
    );
  }
}
