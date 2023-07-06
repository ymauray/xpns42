import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_settings_provider.g.dart';

class AppSettings {
  AppSettings(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  bool get isDarkMode => sharedPreferences.getBool('isDarkMode') ?? false;

  set isDarkMode(bool value) {
    sharedPreferences.setBool('isDarkMode', value);
  }
}

@riverpod
FutureOr<AppSettings> appSettings(AppSettingsRef ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  return AppSettings(sharedPreferences);
}
