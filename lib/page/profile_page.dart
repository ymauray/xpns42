import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pointycastle/export.dart';
import 'package:xpns42/provider/auth_provider.dart';
import 'package:xpns42/provider/crypto_provider.dart';
import 'package:xpns42/provider/long_operation_status_provider.dart';
import 'package:xpns42/provider/secure_storage_provider.dart';
import 'package:xpns42/utils/localization_extension.dart';
import 'package:xpns42/widget/long_operation_indicator.dart';
import 'package:xpns42/widget/padded_form.dart';

class ProfilePage extends ConsumerWidget {
  ProfilePage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _displayNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _emailController.text = FirebaseAuth.instance.currentUser!.email ?? '';
    _displayNameController.text = ref.read(authProvider).currentUserDisplayName;

    final secureStorage = ref.read(secureStorageProvider.notifier);
    final crypto = ref.read(cryptoProvider);
    const message = 'Hello World';

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: Text(context.t.profile)),
          body: SingleChildScrollView(
            child: Column(
              children: [
                PaddedForm(
                  formKey: _formKey,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: context.t.email,
                        enabled: false,
                      ),
                    ),
                    TextFormField(
                      controller: _displayNameController,
                      decoration:
                          InputDecoration(labelText: context.t.displayName),
                      validator: (value) => (value ?? '').isEmpty ? '' : null,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() != true) {
                          return;
                        }
                        FocusManager.instance.primaryFocus?.unfocus();
                        ref.read(longOperationStatusProvider.notifier).start();
                        try {
                          await ref.read(authProvider).updateProfile(
                                displayName: _displayNameController.text,
                              );
                          ref.read(longOperationStatusProvider.notifier).stop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green,
                              content:
                                  Text(context.t.profileUpdatedSuccessfully),
                            ),
                          );
                        } catch (e) {
                          ref.read(longOperationStatusProvider.notifier).stop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(e.toString()),
                            ),
                          );
                        }
                      },
                      child: Text(context.t.updateProfile),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () async {
                            await Navigator.of(context)
                                .pushReplacementNamed('/login');
                          },
                          child: Text(
                            context.t.changeAccount,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                FutureBuilder<AsymmetricKeyPair<RSAPublicKey, RSAPrivateKey>>(
                  builder: (
                    context,
                    snapshot,
                  ) {
                    if (snapshot.hasData) {
                      debugPrint('snapshot.data: ${snapshot.data}');
                      final keys = snapshot.data!;
                      final signature = crypto.sign(message, keys.privateKey);
                      final verified =
                          crypto.verify(signature, message, keys.publicKey);

                      debugPrint('signature: $signature');
                      debugPrint('verified: $verified');

                      return verified
                          ? const ColoredBox(
                              color: Colors.green,
                              child: SizedBox(
                                height: 100,
                                width: double.infinity,
                              ),
                            )
                          : const ColoredBox(
                              color: Colors.red,
                              child: SizedBox(
                                height: 100,
                                width: double.infinity,
                              ),
                            );
                    } else {
                      return const ColoredBox(
                        color: Colors.blue,
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                        ),
                      );
                    }
                  },
                  future: secureStorage.retreiveKeys(
                    account: FirebaseAuth.instance.currentUser!.email!,
                  ),
                ),
              ],
            ),
          ),
        ),
        const LongOperationIndicator(),
      ],
    );
  }
}
