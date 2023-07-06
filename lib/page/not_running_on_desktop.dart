import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotRunningOnDesktop extends ConsumerWidget {
  const NotRunningOnDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Material(
      child: Center(
        child: Text('This app must run on a mobile device.'),
      ),
    );
  }
}
