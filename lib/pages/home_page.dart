import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/l10n/l10n_extension.dart';
import 'package:xpns42/providers/account_list_provider.dart';
import 'package:xpns42/repositories/account_repository.dart';
import 'package:xpns42/widgets/account_card.dart';
import 'package:xpns42/widgets/new_account_dialog.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(accountListProvider);
    final accountRepository = ref.read(accountProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.t.appTitle),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) async {
              if (value == 0) {
                await FirebaseAuth.instance.signOut();
                await Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/sign_in',
                  (route) => false,
                );
              } else if (value == 1) {
                await showDialog<void>(
                  context: context,
                  builder: (context) => const NewAccountDialog(),
                );
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<int>>[
                //const PopupMenuItem(
                //  value: 1,
                //  child: Row(
                //    children: [
                //      Icon(Icons.settings),
                //      SizedBox(width: 8),
                //      Text('Settings'),
                //    ],
                //  ),
                //),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      const Icon(Icons.add),
                      const SizedBox(width: 8),
                      Text(context.t.addAccount),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      const Icon(Icons.import_export),
                      const SizedBox(width: 8),
                      Text(context.t.import),
                    ],
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      const Icon(Icons.logout),
                      const SizedBox(width: 8),
                      Text(context.t.logout),
                    ],
                  ),
                ),
              ];
            },
          ),
          //IconButton(
          //  onPressed: () async {
          //    await FirebaseAuth.instance.signOut();
          //    await Navigator.pushNamedAndRemoveUntil(
          //      context,
          //      '/sign_in',
          //      (route) => false,
          //    );
          //  },
          //  icon: const Icon(Icons.logout),
          //),
        ],
      ),
      body: accounts.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final account = data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AccountCard(
                  account: account,
                  accountRepository: accountRepository,
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          return Center(
            child: Text(error.toString()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog<void>(
            context: context,
            builder: (context) => const NewAccountDialog(),
          );
        },
        tooltip: context.t.addAccount,
        child: const Icon(Icons.add),
      ),
    );
  }
}
