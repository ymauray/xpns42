import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormTextField extends ConsumerWidget {
  const FormTextField({
    required this.label,
    required this.controller,
    required this.readOnly,
    this.prefixIcon,
    this.focusColor,
    super.key,
  }) : obscureText = false;

  const FormTextField.password({
    required this.label,
    required this.controller,
    required this.readOnly,
    this.prefixIcon,
    this.focusColor,
    super.key,
  }) : obscureText = true;

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;
  final Widget? prefixIcon;
  final Color? focusColor;

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
        cursorColor: focusColor ?? Colors.grey,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: label,
          prefixIcon: prefixIcon,
          prefixIconColor: MaterialStateColor.resolveWith(
            (states) => states.contains(MaterialState.focused)
                ? focusColor ?? Colors.grey
                : Colors.grey,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(width: 2, color: focusColor ?? Colors.grey),
          ),
        ),
      ),
    );
  }
}
