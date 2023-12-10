import 'package:flutter/material.dart';

class WrappedTextFormField extends FormField<String> {
  WrappedTextFormField({
    required IconData iconData,
    required String label,
    required TextEditingController controller,
    required Color tileColor,
    super.key,
    bool obscureText = false,
    super.validator,
    bool? enabled,
    super.autovalidateMode,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) : super(
          initialValue: controller.text,
          enabled: enabled ?? true,
          builder: (FormFieldState<String> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    top: 16,
                  ),
                  child: Text(
                    label,
                    style: TextStyle(color: field.hasError ? Colors.red : null),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      iconData,
                      color: field.hasError ? Colors.red : null,
                    ),
                    tileColor: tileColor,
                    title: TextField(
                      onChanged: field.didChange,
                      controller: controller,
                      obscureText: obscureText,
                      textCapitalization: textCapitalization,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
}
