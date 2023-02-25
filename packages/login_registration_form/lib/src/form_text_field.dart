import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormTextField extends ConsumerWidget {
  const FormTextField({
    required this.label,
    required this.controller,
    required this.readOnly,
    super.key,
  }) : obscureText = false;

  const FormTextField.password({
    required this.label,
    required this.controller,
    required this.readOnly,
    super.key,
  }) : obscureText = true;

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
        ),
      ),
    );
  }
}
