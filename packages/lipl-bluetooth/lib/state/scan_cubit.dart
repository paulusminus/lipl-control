import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:logging/logging.dart';
import 'state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit({required this.logger})
      : super(ScanState(isScanning: FlutterBluePlus.isScanningNow)) {
    FlutterBluePlus.isScanning.listen(
      (isScanning) {
        emit(state.copyWith(isScanning: isScanning));
      },
    );
    _streamSubscription = FlutterBluePlus.scanResults.listen(
      (scanResults) {
        emit(state.copyWith(scanResults: scanResults));
      },
      onError: (error) {
        addError(error);
      },
    );
  }

  final Logger logger;
  StreamSubscription<List<ScanResult>>? _streamSubscription;
  StreamSubscription<BluetoothConnectionState>? _connectionStateSubsribtion;

  Future<void> startScanning() async {
    emit(state.copyWith(isScanning: true, scanResults: []));
    await FlutterBluePlus.startScan(withKeywords: ['lipl']);
    emit(state.copyWith(isScanning: false));
  }

  Future<void> _write(
      BluetoothCharacteristic? characteristic, String text) async {
    try {
      await characteristic?.write(utf8.encoder.convert(text),
          withoutResponse: true);
    } catch (error) {
      addError(error);
    }
  }

  Future<void> writeText(String text) async {
    await _write(state.connectedDevice?.textCharacteristic, text);
  }

  Future<void> writeStatus(String text) async {
    await _write(state.connectedDevice?.statusCharacteristic, text);
  }

  Future<void> writeCommand(String text) async {
    await _write(state.connectedDevice?.commandCharacteristic, text);
  }

  Future<void> connect(BluetoothDevice device) async {
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
      logger.info('Service list ${device.servicesList}');
      final displayService = device.servicesList
          .where((e) => e.serviceUuid == liplDisplayServiceUuid)
          .where(
            (element) => element.isPrimary,
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
      logger.info("Found dislay service");

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

  Future<void> disconnect() async {
    try {
      await state.connectedDevice?.device.disconnect();
      await _connectionStateSubsribtion?.cancel();
      emit(state.copyWith(connectedDevice: null));
    } catch (error) {
      addError(error);
    }
  }

  Future<void> stopScanning() async {
    await FlutterBluePlus.stopScan();
    emit(state.copyWith(isScanning: false));
  }

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await super.close();
  }
}
