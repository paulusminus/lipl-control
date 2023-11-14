import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lipl_ble/lipl_ble.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterReactiveBle extends Mock implements FlutterReactiveBle {}

void main() {
  group('BleConnectionState', () {
    BleConnectionState createSubject() => const BleConnectionState(
          deviceId: 'deviceId',
          connectionState: null,
          text: 'text',
          status: 'status',
          command: 'command',
        );

    test('Constructor', () {
      final BleConnectionState state = createSubject();
      expect(state.deviceId, 'deviceId');
      expect(state.connectionState, null);
      expect(state.text, 'text');
      expect(state.status, 'status');
      expect(state.command, 'command');
    });

    test('Initial value', () {
      final BleConnectionState state = BleConnectionState.initial();
      expect(state.deviceId, null);
      expect(state.connectionState, null);
      expect(state.text, null);
      expect(state.status, null);
      expect(state.command, null);
    });

    test('Equaility', () {
      expect(createSubject(), createSubject());
    });

    test('CopyWith Equaility', () {
      expect(createSubject(), createSubject().copyWith());
    });

    test('CopyWith change device', () {
      final BleConnectionState state =
          createSubject().copyWith(deviceId: () => 'device 2');
      expect(state.deviceId, 'device 2');
    });

    test('Props', () {
      expect(createSubject().props,
          ['deviceId', null, 'text', 'status', 'command']);
    });

    test('isConnected true', () {
      expect(
        BleConnectionState.initial()
            .copyWith(
              deviceId: () => 'pi',
              connectionState: () => DeviceConnectionState.connected,
            )
            .isConnected,
        true,
      );
    });

    test('isConnected false', () {
      expect(
        BleConnectionState.initial().isConnected,
        false,
      );
      expect(
        BleConnectionState.initial().copyWith(deviceId: () => 'pi').isConnected,
        false,
      );
      expect(
        BleConnectionState.initial()
            .copyWith(
                deviceId: () => 'pi',
                connectionState: () => DeviceConnectionState.connecting)
            .isConnected,
        false,
      );
    });
  });
  group('BleConnectionCubit', () {
    late FlutterReactiveBle mock;

    final DiscoveredDevice discoveredDevice = DiscoveredDevice(
      id: '43:45:C0:00:1F:AC',
      name: 'pi',
      serviceData: const {},
      manufacturerData: Uint8List.fromList([13, 240, 33, 34, 35, 36]),
      rssi: -50,
      serviceUuids: [displayServiceUuid],
    );

    Stream<DiscoveredDevice?> selectedDeviceStream() => Stream.fromIterable([
          discoveredDevice,
        ]);

    test(
      'Constructor',
      () {
        mock = MockFlutterReactiveBle();
        final cubit = BleConnectionCubit(
          flutterReactiveBle: mock,
        );
        expect(
          cubit.state,
          BleConnectionState.initial(),
        );
      },
    );

    blocTest<BleConnectionCubit, BleConnectionState>('Connect',
        setUp: () {
          mock = MockFlutterReactiveBle();
          when(
            () => mock.connectToDevice(
              id: any(named: 'id'),
              connectionTimeout: any(named: 'connectionTimeout'),
            ),
          ).thenAnswer(
            (_) => Stream.fromIterable(
              [
                const ConnectionStateUpdate(
                  deviceId: '43:45:C0:00:1F:AC',
                  connectionState: DeviceConnectionState.connected,
                  failure: null,
                ),
              ],
            ),
          );
        },
        build: () => BleConnectionCubit(
              flutterReactiveBle: mock,
              stream: selectedDeviceStream(),
            ),
        expect: () => [
              BleConnectionState.initial().copyWith(
                deviceId: () => '43:45:C0:00:1F:AC',
                connectionState: () => DeviceConnectionState.connected,
              ),
            ],
        verify: (_) {
          verify(
            () => mock.connectToDevice(
              id: any(named: 'id'),
              connectionTimeout: any(named: 'connectionTimeout'),
            ),
          ).called(1);
        });

    blocTest<BleConnectionCubit, BleConnectionState>(
        'Connect with stream including null',
        setUp: () {
          mock = MockFlutterReactiveBle();
          when(
            () => mock.connectToDevice(
              id: any(named: 'id'),
              connectionTimeout: any(named: 'connectionTimeout'),
            ),
          ).thenAnswer(
            (_) => Stream.fromIterable(
              [
                const ConnectionStateUpdate(
                  deviceId: '43:45:C0:00:1F:AC',
                  connectionState: DeviceConnectionState.connected,
                  failure: null,
                ),
              ],
            ),
          );
        },
        build: () => BleConnectionCubit(
              flutterReactiveBle: mock,
              stream: Stream.fromIterable([discoveredDevice, null]),
            ),
        expect: () => [
              BleConnectionState.initial().copyWith(
                deviceId: () => '43:45:C0:00:1F:AC',
                connectionState: () => DeviceConnectionState.connected,
              ),
              BleConnectionState.initial(),
            ],
        verify: (_) {
          verify(
            () => mock.connectToDevice(
              id: any(named: 'id'),
              connectionTimeout: any(named: 'connectionTimeout'),
            ),
          ).called(1);
        });

    blocTest<BleConnectionCubit, BleConnectionState>('Connect errors',
        setUp: () {
          mock = MockFlutterReactiveBle();
          when(
            () => mock.connectToDevice(
              id: any(named: 'id'),
              connectionTimeout: any(named: 'connectionTimeout'),
            ),
          ).thenAnswer(
            (_) => Stream.error('Failed'),
          );
        },
        build: () => BleConnectionCubit(
              flutterReactiveBle: mock,
              stream: selectedDeviceStream(),
            ),
        wait: const Duration(milliseconds: 500),
        expect: () => [],
        verify: (_) {
          verify(
            () => mock.connectToDevice(
              id: any(named: 'id'),
              connectionTimeout: any(named: 'connectionTimeout'),
            ),
          ).called(1);
        });

    blocTest<BleConnectionCubit, BleConnectionState>(
      'Update text',
      setUp: () {
        mock = MockFlutterReactiveBle();
      },
      build: () => BleConnectionCubit(
        flutterReactiveBle: mock,
      ),
      seed: () => BleConnectionState.initial().copyWith(text: () => 'text'),
      act: (cubit) => cubit.updateText('text 2'),
      expect: () => [
        BleConnectionState.initial().copyWith(text: () => 'text 2'),
      ],
    );

    blocTest<BleConnectionCubit, BleConnectionState>(
      'Update status',
      setUp: () {
        mock = MockFlutterReactiveBle();
      },
      build: () => BleConnectionCubit(
        flutterReactiveBle: mock,
      ),
      seed: () => BleConnectionState.initial().copyWith(status: () => 'status'),
      act: (cubit) => cubit.updateStatus('status 2'),
      expect: () => [
        BleConnectionState.initial().copyWith(status: () => 'status 2'),
      ],
    );

    blocTest<BleConnectionCubit, BleConnectionState>(
      'Update command',
      setUp: () {
        mock = MockFlutterReactiveBle();
      },
      build: () => BleConnectionCubit(
        flutterReactiveBle: mock,
      ),
      seed: () =>
          BleConnectionState.initial().copyWith(command: () => 'command'),
      act: (cubit) => cubit.updateCommand('command 2'),
      expect: () => [
        BleConnectionState.initial().copyWith(command: () => 'command 2'),
      ],
    );

    blocTest<BleConnectionCubit, BleConnectionState>(
      'Write text',
      setUp: () {
        mock = MockFlutterReactiveBle();
        when(
          () => mock.writeCharacteristicWithoutResponse(
            QualifiedCharacteristic(
              characteristicId: textCharacteristicUuid,
              serviceId: displayServiceUuid,
              deviceId: 'pi',
            ),
            value: const Utf8Encoder().convert('text'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => BleConnectionCubit(
        flutterReactiveBle: mock,
      ),
      seed: () => BleConnectionState.initial().copyWith(
        text: () => 'text',
        deviceId: () => 'pi',
      ),
      act: (cubit) => cubit.writeText(),
      expect: () => [
        BleConnectionState.initial().copyWith(deviceId: () => 'pi'),
      ],
    );

    blocTest<BleConnectionCubit, BleConnectionState>(
      'Write status',
      setUp: () {
        mock = MockFlutterReactiveBle();
        when(
          () => mock.writeCharacteristicWithoutResponse(
            QualifiedCharacteristic(
              characteristicId: statusCharacteristicUuid,
              serviceId: displayServiceUuid,
              deviceId: 'pi',
            ),
            value: const Utf8Encoder().convert('status'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => BleConnectionCubit(
        flutterReactiveBle: mock,
      ),
      seed: () => BleConnectionState.initial().copyWith(
        status: () => 'status',
        deviceId: () => 'pi',
      ),
      act: (cubit) => cubit.writeStatus(),
      expect: () => [
        BleConnectionState.initial().copyWith(deviceId: () => 'pi'),
      ],
    );

    blocTest<BleConnectionCubit, BleConnectionState>(
      'Write command',
      setUp: () {
        mock = MockFlutterReactiveBle();
        when(
          () => mock.writeCharacteristicWithoutResponse(
            QualifiedCharacteristic(
              characteristicId: commandCharacteristicUuid,
              serviceId: displayServiceUuid,
              deviceId: 'pi',
            ),
            value: const Utf8Encoder().convert('command'),
          ),
        ).thenAnswer((_) async {});
      },
      build: () => BleConnectionCubit(
        flutterReactiveBle: mock,
      ),
      seed: () => BleConnectionState.initial().copyWith(
        command: () => 'command',
        deviceId: () => 'pi',
      ),
      act: (cubit) => cubit.writeCommand(),
      expect: () => [
        BleConnectionState.initial().copyWith(deviceId: () => 'pi'),
      ],
    );
  });
}
