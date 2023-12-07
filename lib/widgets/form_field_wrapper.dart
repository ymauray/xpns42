import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormFieldWrapper extends ConsumerWidget {
  const FormFieldWrapper({
    required this.label,
    required this.formField,
    this.leading,
    this.trailing,
    super.key,
  });

  final Widget? leading;
  final String label;
  final Widget formField;
  final Widget? trailing;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
          ),
          child: Text(label),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: leading,
            tileColor: Theme.of(context).colorScheme.surfaceVariant,
            title: formField,
            trailing: trailing,
          ),
        ),
      ],
    );
  }
}
