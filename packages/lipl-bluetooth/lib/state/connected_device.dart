import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connected_device.freezed.dart';

@freezed
abstract class ConnectedDevice with _$ConnectedDevice {
  const factory ConnectedDevice({
    required BluetoothDevice device,
    required BluetoothService displayService,
    required BluetoothCharacteristic textCharacteristic,
    required BluetoothCharacteristic statusCharacteristic,
    required BluetoothCharacteristic commandCharacteristic,
  }) = _ConnectedDevice;
}
