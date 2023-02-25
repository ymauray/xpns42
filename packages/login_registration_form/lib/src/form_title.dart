import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormTitle extends ConsumerWidget {
  const FormTitle({
    required this.title,
    super.key,
  });

  final Widget title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: ColoredBox(
            color: const Color(0xFF4f4587),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: title,
            ),
          ),
        ),
      ],
    );
  }
}
