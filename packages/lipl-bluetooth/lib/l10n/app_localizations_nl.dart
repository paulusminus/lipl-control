import 'app_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class BluetoothAppLocalizationsNl extends BluetoothAppLocalizations {
  BluetoothAppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get bluetoothConnectedTo => 'Verbonden met afstandsbediening';

  @override
  String get bluetoothTitle => 'TV Verbindingen';

  @override
  String get bluetoothActiveConnection => 'Nu verbonden met';

  @override
  String get bluetoothPossibleConnections => 'Mogelijke verbindingen';

  @override
  String get bluetoothWaitForConnection => 'Wacht op verbinding';
}
