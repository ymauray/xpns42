import 'package:flutter/material.dart';
import 'package:xpns42/l10n/l10n_extension.dart';

enum ErrorCode {
  errorLoadingLedgers(0x00000001);

  const ErrorCode(this.code);

  final int code;
}

class ErrorText extends StatelessWidget {
  const ErrorText({
    required this.code,
    super.key,
  }) : super();

  final ErrorCode code;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.t.oupsAnErrorOccured} : ${code.name} + ($code.code)',
      style: const TextStyle(color: Colors.red),
    );
  }
}
