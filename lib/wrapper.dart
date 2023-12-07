import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/pages/front_page.dart';
import 'package:xpns42/pages/ledgers_list_page.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final secureStorage = ref.read(secureStorageProvider);
    //final ledgerRepository = ref.read(ledgerRepositoryProvider);

    return FirebaseAuth.instance.currentUser == null
        ? const FrontPage()
        : const LedgersListPage();
  }
}
