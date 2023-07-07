import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/utils/constants.dart';
import 'package:xpns42/widget/form_field_row.dart';

class PaddedForm extends ConsumerWidget {
  const PaddedForm({
    required this.children,
    required this.formKey,
    this.padding = kFormPadding,
    this.mainAxisAlignment = MainAxisAlignment.center,
    super.key,
  });

  final List<Widget> children;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        children: children
            .map(
              (e) => FormFieldRow(
                padding: padding,
                child: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
