import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'state.dart';

part 'scan_state.freezed.dart';

@freezed
class ScanState with _$ScanState {
  const ScanState._();
  const factory ScanState({
    @Default([]) List<ScanResult> scanResults,
    required bool isScanning,
    @Default(null) ConnectedDevice? connectedDevice,
  }) = _ScanState;

  bool isConnected() =>
      connectedDevice != null && connectedDevice!.device.isConnected;
}
