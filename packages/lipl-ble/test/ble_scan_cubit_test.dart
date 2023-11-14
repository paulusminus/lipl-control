import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_reactive_ble/flutter_reactive_ble.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lipl_ble/lipl_ble.dart';
import 'package:mocktail/mocktail.dart';

class MockFlutterReactiveBle extends Mock implements FlutterReactiveBle {}

void main() {
  group(
    'BleScanState',
    () {
      BleScanState createSubject() => const BleScanState(
            scanning: false,
            devices: [],
            selectedDevice: null,
            lastError: null,
          );

      test(
        'Constructor',
        () {
          final state = createSubject();
          expect(
            state.scanning,
            false,
          );
          expect(
            state.devices,
            [],
          );
          expect(
            state.lastError,
            null,
          );
        },
      );

      test(
        'Equality',
        () {
          expect(
            createSubject(),
            createSubject(),
          );
        },
      );

      test(
        'Props',
        () {
          expect(
            createSubject().props,
            [false, [], null, null],
          );
        },
      );
    },
  );

  group(
    'BleScanCubit',
    () {
      DiscoveredDevice createSubjectDevice() => DiscoveredDevice(
            id: '43:45:C0:00:1F:AC',
            name: 'pi',
            serviceData: const {},
            manufacturerData: Uint8List.fromList([]),
            rssi: 8,
            serviceUuids: [
              displayServiceUuid,
            ],
          );
      blocTest<BleScanCubit, BleScanState>(
        'Start',
        build: () {
          final mock = MockFlutterReactiveBle();
          when(
            () => mock.scanForDevices(withServices: [displayServiceUuid]),
          ).thenAnswer(
            (invocation) => Stream.fromIterable(
              [
                createSubjectDevice(),
                createSubjectDevice(),
              ],
            ),
          );
          return BleScanCubit(flutterReactiveBle: mock);
        },
        act: (cubit) => cubit.start(),
        expect: () => [
          const BleScanState(
            scanning: true,
            devices: [],
            selectedDevice: null,
            lastError: null,
          ),
          BleScanState(
            scanning: true,
            devices: [createSubjectDevice()],
            selectedDevice: null,
            lastError: null,
          ),
          BleScanState(
            scanning: false,
            devices: [createSubjectDevice()],
            selectedDevice: null,
            lastError: null,
          ),
        ],
      );

      blocTest<BleScanCubit, BleScanState>(
        'Start errors',
        build: () {
          final mock = MockFlutterReactiveBle();
          when(
            () => mock.scanForDevices(withServices: [displayServiceUuid]),
          ).thenAnswer(
            (_) => Stream.error('StreamError'),
          );
          return BleScanCubit(flutterReactiveBle: mock);
        },
        act: (cubit) async {
          await cubit.start();
        },
        expect: () => [
          const BleScanState(
            scanning: true,
            devices: [],
            selectedDevice: null,
            lastError: null,
          ),
          const BleScanState(
            scanning: false,
            devices: [],
            selectedDevice: null,
            lastError: 'StreamError',
          ),
        ],
      );

      blocTest<BleScanCubit, BleScanState>(
        'Stop',
        build: () => BleScanCubit(flutterReactiveBle: MockFlutterReactiveBle()),
        seed: () => BleScanState.initial().copyWith(scanning: true),
        act: (cubit) async {
          await cubit.stop();
        },
        expect: () => [
          BleScanState.initial().copyWith(scanning: false),
        ],
      );
    },
  );
}
