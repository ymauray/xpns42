import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_provider.g.dart';

@riverpod
class Preferences extends _$Preferences {
  @override
  FutureOr<SharedPreferences> build() async {
    return SharedPreferences.getInstance();
  }
}
