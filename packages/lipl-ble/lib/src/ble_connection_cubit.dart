import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:logging/logging.dart' as log;
import 'constant.dart';

class BleConnectionState extends Equatable {
  const BleConnectionState({
    required this.deviceId,
    required this.connectionState,
    required this.text,
    required this.status,
    required this.command,
  });

  final String? deviceId;
  final DeviceConnectionState? connectionState;
  final String? text;
  final String? status;
  final String? command;

  factory BleConnectionState.initial() => const BleConnectionState(
        deviceId: null,
        connectionState: null,
        text: null,
        status: null,
        command: null,
      );

  BleConnectionState copyWith({
    String? Function()? deviceId,
    DeviceConnectionState? Function()? connectionState,
    String? Function()? text,
    String? Function()? status,
    String? Function()? command,
  }) =>
      BleConnectionState(
        deviceId: deviceId == null ? this.deviceId : deviceId(),
        connectionState:
            connectionState == null ? this.connectionState : connectionState(),
        text: text == null ? this.text : text(),
        status: status == null ? this.status : status(),
        command: command == null ? this.command : command(),
      );

  bool get isConnected =>
      deviceId != null && connectionState == DeviceConnectionState.connected;

  @override
  List<Object?> get props => [deviceId, connectionState, text, status, command];
}

class BleConnectionCubit extends Cubit<BleConnectionState> {
  BleConnectionCubit({
    Stream<DiscoveredDevice?>? stream = const Stream.empty(),
    required FlutterReactiveBle? flutterReactiveBle,
    log.Logger? logger,
  }) : super(BleConnectionState.initial()) {
    _flutterReactiveBle = flutterReactiveBle;
    _logger = logger;

    _discoveredDeviceSubscription = stream?.asyncMap((device) async {
      if (device == null) {
        await _streamSubscription?.cancel();
        emit(state.copyWith(deviceId: () => null, connectionState: () => null));
      } else {
        await connect(device.id);
      }
    }).listen((_) {});
  }

  late StreamSubscription<DiscoveredDevice?>? _discoveredDeviceSubscription;
  late log.Logger? _logger;
  late FlutterReactiveBle? _flutterReactiveBle;
  static const Utf8Encoder encoder = Utf8Encoder();
  StreamSubscription<ConnectionStateUpdate>? _streamSubscription;

  @override
  Future<void> close() async {
    await _streamSubscription?.cancel();
    await _discoveredDeviceSubscription?.cancel();
    return super.close();
  }

  void updateText(String value) {
    emit(
      state.copyWith(
        text: () => value,
      ),
    );
  }

  void updateStatus(String value) {
    emit(
      state.copyWith(
        status: () => value,
      ),
    );
  }

  void updateCommand(String value) {
    emit(
      state.copyWith(
        command: () => value,
      ),
    );
  }

  Future<void> connect(String deviceId) async {
    _logger?.info('Cancelling current connection if exists');
    await _streamSubscription?.cancel();
    _logger?.info('Finished cancelling current connection');
    _logger?.info('Starting connecting to $deviceId');
    _streamSubscription = _flutterReactiveBle
        ?.connectToDevice(
      id: deviceId,
      connectionTimeout: const Duration(seconds: 10),
    )
        .listen(
      (ConnectionStateUpdate event) {
        _logger?.info('Device ${event.deviceId}: ${event.connectionState}');
        emit(
          state.copyWith(
            deviceId: () => event.deviceId,
            connectionState: () => event.connectionState,
          ),
        );
      },
      onError: (error) {
        _logger?.info(error);
      },
    );
  }

  Future<void> writeText() async {
    if (await _write(textCharacteristicUuid, state.text)) {
      emit(
        state.copyWith(
          text: () => null,
        ),
      );
    }
  }

  Future<void> writeStatus() async {
    if (await _write(statusCharacteristicUuid, state.status)) {
      emit(
        state.copyWith(
          status: () => null,
        ),
      );
    }
  }

  Future<void> writeCommand() async {
    if (await _write(commandCharacteristicUuid, state.command)) {
      emit(
        state.copyWith(
          command: () => null,
        ),
      );
    }
  }

  Future<bool> _write(Uuid uuid, String? value) async {
    if (state.deviceId != null && value != null) {
      final characteristic = QualifiedCharacteristic(
        characteristicId: uuid,
        serviceId: displayServiceUuid,
        deviceId: state.deviceId!,
      );
      try {
        await _flutterReactiveBle?.writeCharacteristicWithoutResponse(
          characteristic,
          value: encoder.convert(value),
        );
        return true;
      } catch (error) {
        return false;
      }
    }
    return false;
  }
}

class BleNoConnectionCubit extends BleConnectionCubit {
  BleNoConnectionCubit() : super(flutterReactiveBle: null);

  @override
  void updateText(String value) {}

  @override
  void updateStatus(String value) {}

  @override
  void updateCommand(String value) {}

  @override
  Future<void> connect(String deviceId) => Future.value();

  @override
  Future<void> writeText() => Future.value();

  @override
  Future<void> writeStatus() => Future.value();

  @override
  Future<void> writeCommand() => Future.value();
}
