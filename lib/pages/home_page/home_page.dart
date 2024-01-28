import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/providers/groups_provider.dart';
import 'package:xpns42/wigets/group_form.dart';
import 'package:xpns42/wigets/ledger_form.dart';
import 'package:xpns42/wigets/ledgers_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    final groups = ref.watch(groupsProvider);

    return Scaffold(
      appBar: groups.when(
        data: (groups) => AppBar(
          title: groups.isNotEmpty
              ? Text(groups.first.name)
              : const Text('DuoBudget'),
        ),
        loading: () => AppBar(
          title: const Text('Loading...'),
        ),
        error: (error, stack) => AppBar(
          title: const Text('Error'),
        ),
      ),
      body: groups.when(
        data: (groups) {
          if (groups.isEmpty) {
            Future.delayed(
              const Duration(milliseconds: 500),
              () => GroupForm.show(context),
            );
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vous n'avez pas encore de groupe",
                  ),
                ],
              ),
            );
          } else {
            return LedgersList(group: groups.first);
          }
        },
        loading: () => const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Loading...',
              ),
              CircularProgressIndicator(),
            ],
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'An error has occurred:',
              ),
              Text(
                '$error',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => LedgerForm.show(context, groups.value!.first.id!),
        tooltip: 'Ajouter un compte',
        child: const Icon(Icons.add),
      ),
    );
  }
}
