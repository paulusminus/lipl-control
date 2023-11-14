import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';

const String _displayServiceUuidString = "27a70fc8-dc38-40c7-80bc-359462e4b808";
const String _textCharacteristicUuidString =
    "04973569-c039-4ce9-ad96-861589a74f9e";
const String _statusCharacteristicUuidString =
    "61a8cb7f-d4c1-49b7-a3cf-f2c69dbb7aeb";
const String _commandCharacteristicUuidString =
    "da35e0b2-7864-49e5-aa47-8050d1cc1484";

final Uuid displayServiceUuid = Uuid.parse(_displayServiceUuidString);
final Uuid textCharacteristicUuid = Uuid.parse(_textCharacteristicUuidString);
final Uuid statusCharacteristicUuid =
    Uuid.parse(_statusCharacteristicUuidString);
final Uuid commandCharacteristicUuid =
    Uuid.parse(_commandCharacteristicUuidString);
