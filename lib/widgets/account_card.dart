import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpns42/models/account_proxy.dart';
import 'package:xpns42/repositories/account_repository.dart';

class AccountCard extends ConsumerWidget {
  const AccountCard({
    required this.account,
    required this.accountRepository,
    super.key,
  });

  final AccountProxy account;
  final AccountRepository accountRepository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(account.title),
        trailing: const Icon(
          Icons.keyboard_arrow_right_outlined,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            '/account',
            arguments: account,
          );
        },
      ),
    );
  }
}
