import 'package:flutter/widgets.dart';
import 'package:lipl_control/l10n/arb/app_localizations.dart';
export 'package:lipl_control/l10n/arb/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
