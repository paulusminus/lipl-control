import 'app_localizations.dart';

/// The translations for English (`en`).
class BluetoothAppLocalizationsEn extends BluetoothAppLocalizations {
  BluetoothAppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get connectTo => 'Connected to';

  @override
  String get bluetoothTitle => 'TV connections';

  @override
  String get bluetoothActiveConnection => 'Active connection';

  @override
  String get bluetoothPossibleConnections => 'Possible connections';
}
