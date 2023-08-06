import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/pages/home_page.dart';
import 'package:xpns42/pages/sign_in_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FirebaseAuth.instance.currentUser == null
        ? const SignInPage()
        : const HomePage();
  }
}
