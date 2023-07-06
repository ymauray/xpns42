import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/utils/constants.dart';

class FormFieldRow extends ConsumerWidget {
  const FormFieldRow({
    required this.child,
    this.padding = kFormPadding,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
