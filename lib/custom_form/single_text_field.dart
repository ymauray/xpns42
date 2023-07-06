import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SingleTextField extends ConsumerWidget {
  const SingleTextField({
    required this.labelText,
    required this.controller,
    this.keyboadType,
    this.flex = 1,
    super.key,
  });

  final String labelText;
  final TextEditingController controller;
  final TextInputType? keyboadType;
  final int flex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          keyboardType: keyboadType,
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            ),
            labelText: labelText,
          ),
        ),
      ),
    );
  }
}
