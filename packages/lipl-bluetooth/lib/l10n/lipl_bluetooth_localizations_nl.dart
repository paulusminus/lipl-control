import 'lipl_bluetooth_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class BluetoothAppLocalizationsNl extends BluetoothAppLocalizations {
  BluetoothAppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get connectTo => 'Verbonden met';

  @override
  String get bluetoothTitle => 'TV Verbindingen';

  @override
  String get bluetoothActiveConnection => 'Nu verbonden met';

  @override
  String get bluetoothPossibleConnections => 'Mogelijke verbindingen';
}
