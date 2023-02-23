import 'package:pocketbase/pocketbase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_provider.g.dart';

@riverpod
class Repository extends _$Repository {
  @override
  PocketBase build() {
    return PocketBase('https://xpns42.yannickmauray.ch');
  }
}
