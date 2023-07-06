import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  String get l10n => Localizations.localeOf(this).languageCode;
  AppLocalizations get t => AppLocalizations.of(this)!;
}
