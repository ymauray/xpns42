import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';

class LongOperationIndicator extends ConsumerWidget {
  const LongOperationIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final longOperationStatus = ref.watch(longOperationStatusProvider);

    return longOperationStatus
        ? const ColoredBox(
            color: Colors.white70,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container();
  }
}
