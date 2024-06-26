import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanState(isScanning: FlutterBluePlus.isScanningNow)) {
    _isScanningSubscription = FlutterBluePlus.isScanning.listen(
      (isScanning) {
        emit(state.copyWith(isScanning: isScanning));
      },
    );
    _streamSubscription = FlutterBluePlus.scanResults.listen(
      (scanResults) {
        final liplDevices = scanResults
            .where(
              (scanResult) =>
                  scanResult.advertisementData.serviceUuids
                      .contains(liplDisplayServiceUuid) &&
                  scanResult.advertisementData.connectable,
            )
            .toList();
        if (liplDevices.isNotEmpty) {
          final devicesFound = liplDevices
              .map((scanResult) => scanResult.device.remoteId.toString())
              .join(', ');
          bluetoothLogger.info('found lipl devices on systems: $devicesFound');
        }
        emit(state.copyWith(scanResults: liplDevices));
      },
      onError: (error) {
        addError(error);
      },
    );
  }

  late StreamSubscription<bool> _isScanningSubscription;
  late StreamSubscription<List<ScanResult>> _streamSubscription;
  StreamSubscription<BluetoothConnectionState>? _connectionStateSubsribtion;

  startScanning() async {
    await FlutterBluePlus.startScan();
  }

  _write(BluetoothCharacteristic? characteristic, String text) async {
    try {
      await characteristic?.write(utf8.encoder.convert(text),
          withoutResponse: true);
    } catch (error) {
      addError(error);
    }
  }

  writeText(String text) async {
    await _write(state.connectedDevice?.textCharacteristic, text);
  }

  writeStatus(String text) async {
    await _write(state.connectedDevice?.statusCharacteristic, text);
  }

  writeCommand(String text) async {
    await _write(state.connectedDevice?.commandCharacteristic, text);
  }

  connect(BluetoothDevice device) async {
    try {
      await disconnect();
      await device.connect();
      await _connectionStateSubsribtion?.cancel();
      _connectionStateSubsribtion =
          device.connectionState.listen((connectionState) {
        if (connectionState == BluetoothConnectionState.disconnected) {
          emit(state.copyWith(connectedDevice: null));
        }
      });
      await device.discoverServices();
      bluetoothLogger.info('Service list ${device.servicesList}');
      final displayService = device.servicesList
          .where((service) => service.serviceUuid == liplDisplayServiceUuid)
          .where(
            (service) => service.isPrimary,
          )
          .firstOrNull;
      final textCharacteristic = displayService?.characteristics
          .where((characteristic) =>
              characteristic.characteristicUuid == characteristicTextUuid)
          .firstOrNull;
      final statusCharacteristic = displayService?.characteristics
          .where((characteristic) =>
              characteristic.characteristicUuid == characteristicStatusUuid)
          .firstOrNull;
      final commandCharacteristic = displayService?.characteristics
          .where((characteristic) =>
              characteristic.characteristicUuid == characteristicCommandUuid)
          .firstOrNull;
      bluetoothLogger.info("Found dislay service");

      if (displayService != null &&
          textCharacteristic != null &&
          statusCharacteristic != null &&
          commandCharacteristic != null) {
        final connectedDevice = ConnectedDevice(
          device: device,
          displayService: displayService,
          textCharacteristic: textCharacteristic,
          statusCharacteristic: statusCharacteristic,
          commandCharacteristic: commandCharacteristic,
        );
        emit(state.copyWith(connectedDevice: connectedDevice));
      }
    } catch (error) {
      addError(error);
    }
  }

  disconnect() async {
    try {
      await state.connectedDevice?.device.disconnect();
      await _connectionStateSubsribtion?.cancel();
      emit(state.copyWith(connectedDevice: null));
    } catch (error) {
      addError(error);
    }
  }

  stopScanning() async {
    await FlutterBluePlus.stopScan();
  }

  @override
  close() async {
    await _isScanningSubscription.cancel();
    await _streamSubscription.cancel();
    await _connectionStateSubsribtion?.cancel();
    return super.close();
  }
}
