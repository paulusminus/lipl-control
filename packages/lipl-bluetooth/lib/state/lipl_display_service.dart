import 'package:flutter_blue_plus/flutter_blue_plus.dart';

const int manufacturerId = 0xFFFF;
const List<int> manufacturerData = [0x21, 0x22, 0x232, 0x24];

MsdFilter filterByManufacturer() =>
    MsdFilter(manufacturerId, data: manufacturerData);

final liplDisplayServiceUuid =
    Guid.fromString('27a70fc8-dc38-40c7-80bc-359462e4b808');

/// Uuid identifying the text characteristic on the gatt peripheral
final characteristicTextUuid =
    Guid.fromString("04973569-c039-4ce9-ad96-861589a74f9e");

/// Uuid identifying the status characteristic on the gatt peripheral
final characteristicStatusUuid =
    Guid.fromString("61a8cb7f-d4c1-49b7-a3cf-f2c69dbb7aeb");

/// Uuid identifying the command characteristic on the gatt peripheral
final characteristicCommandUuid =
    Guid.fromString("da35e0b2-7864-49e5-aa47-8050d1cc1484");
