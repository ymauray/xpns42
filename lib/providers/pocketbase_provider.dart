import 'package:pocketbase/pocketbase.dart' as pb;
import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pocketbase_provider.g.dart';

@riverpod
FutureOr<pb.PocketBase> pocketBase(PocketBaseRef ref) async {
  final prefs = await SharedPreferences.getInstance();

  final store = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );

  return pb.PocketBase('https://xpns42.yannickmauray.ch/', authStore: store, lang: 'fr-CH');
}
