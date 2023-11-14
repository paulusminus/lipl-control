import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:logging/logging.dart' as log;
import 'constant.dart';

FlutterReactiveBle flutterReactiveBle() => FlutterReactiveBle();

class BleScanState extends Equatable {
  const BleScanState({
    required this.scanning,
    required this.devices,
    required this.selectedDevice,
    required this.lastError,
  });

  final bool scanning;
  final List<DiscoveredDevice> devices;
  final DiscoveredDevice? selectedDevice;
  final dynamic lastError;

  factory BleScanState.initial() => const BleScanState(
        scanning: false,
        devices: [],
        selectedDevice: null,
        lastError: null,
      );

  BleScanState copyWith({
    bool? scanning,
    List<DiscoveredDevice>? devices,
    DiscoveredDevice? Function()? selectedDevice,
    dynamic Function()? lastError,
  }) =>
      BleScanState(
        scanning: scanning ?? this.scanning,
        devices: devices ?? this.devices,
        selectedDevice:
            selectedDevice == null ? this.selectedDevice : selectedDevice(),
        lastError: lastError == null ? this.lastError : lastError(),
      );

  @override
  List<Object?> get props => [scanning, devices, selectedDevice, lastError];
}

class BleScanCubit extends Cubit<BleScanState> {
  BleScanCubit({
    required FlutterReactiveBle? flutterReactiveBle,
    log.Logger? logger,
  }) : super(BleScanState.initial()) {
    _flutterReactiveBle = flutterReactiveBle;
    _logger = logger;
  }

  late FlutterReactiveBle? _flutterReactiveBle;
  late log.Logger? _logger;
  StreamSubscription<DiscoveredDevice>? _subscription;

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }

  Future<void> start() async {
    await _subscription?.cancel();
    emit(
      state.copyWith(
        scanning: true,
        devices: [],
      ),
    );
    _subscription = _flutterReactiveBle?.scanForDevices(
      withServices: [
        displayServiceUuid,
      ],
    ).listen(
      (DiscoveredDevice device) {
        if (!state.devices
            .map(
              (device) => device.id,
            )
            .contains(device.id)) {
          emit(
            state.copyWith(
              devices: [...state.devices, device],
            ),
          );
        }
      },
      onDone: () {
        _logger?.info('onDone called for start listening');
        emit(
          state.copyWith(scanning: false),
        );
      },
      onError: (error) {
        emit(
          state.copyWith(
            scanning: false,
            lastError: () => error,
          ),
        );
      },
      cancelOnError: false,
    );
  }

  Future<void> stop() async {
    await _subscription?.cancel();
    emit(
      state.copyWith(scanning: false),
    );
  }

  void select(DiscoveredDevice? device) {
    emit(state.copyWith(selectedDevice: () => device));
  }
}

class BleNoScanCubit extends BleScanCubit {
  BleNoScanCubit() : super(flutterReactiveBle: null);

  @override
  Future<void> start() => Future.value();

  @override
  Future<void> stop() => Future.value();
}
