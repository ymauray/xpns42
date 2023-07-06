import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/page/not_running_on_desktop.dart';
import 'package:xpns42/page/sign_in_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Platform.isLinux || Platform.isWindows
        ? const NotRunningOnDesktop()
        : const SignInPage();
  }
}
