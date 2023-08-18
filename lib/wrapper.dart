import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/pages/home_page.dart';
import 'package:xpns42/pages/ledger_page.dart';
import 'package:xpns42/pages/sign_in_page.dart';
import 'package:xpns42/providers/secure_storage_provider.dart';
import 'package:xpns42/repositories/ledger_repository.dart';

class Wrapper extends ConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final secureStorage = ref.read(secureStorageProvider);
    final ledgerRepository = ref.read(ledgerRepositoryProvider);

    return FirebaseAuth.instance.currentUser == null
        ? const SignInPage()
        : FutureBuilder(
            future: Future.wait([
              secureStorage.read(key: 'ledgerId'),
              secureStorage.read(key: 'ledgerPassword')
            ]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final ledgerId = snapshot.data![0];
                final ledgerPassword = snapshot.data![1];
                if (ledgerId != null && ledgerPassword != null) {
                  return FutureBuilder(
                    future: ledgerRepository.load(ledgerId, ledgerPassword),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data == null) {
                          return const HomePage();
                        } else {
                          return LedgerPage(ledger: snapshot.data);
                        }
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else {
                  return const HomePage();
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
  }
}
