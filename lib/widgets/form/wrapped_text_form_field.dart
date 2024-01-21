import 'package:flutter/material.dart';

class WrappedTextFormField extends FormField<String> {
  WrappedTextFormField({
    required IconData iconData,
    required String label,
    required TextEditingController controller,
    required Color tileColor,
    super.key,
    super.validator,
    super.enabled,
    super.autovalidateMode,
    bool obscureText = false,
    bool readonly = false,
    Widget? trailing,
    GestureTapCallback? onTap,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) : assert(
          onTap == null || readonly,
          'readonly must be true if onTap is not null',
        ),
        
        super(
          initialValue: controller.text,
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
                    onTap: onTap,
                    leading: Icon(
                      iconData,
                      color: field.hasError ? Colors.red : null,
                    ),
                    tileColor: tileColor,
                    title: TextField(
                      onTap: onTap,
                      onChanged: field.didChange,
                      controller: controller,
                      obscureText: obscureText,
                      textCapitalization: textCapitalization,
                      readOnly: readonly,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                    trailing: trailing ??
                        (obscureText
                            ? IconButton(
                                icon: const Icon(Icons.visibility),
                                onPressed: () {
                                  // ignore: invalid_use_of_protected_member
                                  field.setState(() {
                                    obscureText = false;
                                  });
                                },
                              )
                            : null),
                  ),
                ),
              ],
            );
          },
        );
}
