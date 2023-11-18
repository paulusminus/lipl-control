import 'lipl_bluetooth_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get connectTo => 'Connected to';

  @override
  String get bluetoothTitle => 'TV connections';

  @override
  String get bluetoothActiveConnection => 'Active connection';

  @override
  String get bluetoothPossibleConnections => 'Possible connections';
}