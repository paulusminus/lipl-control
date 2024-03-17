import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({
    super.key,
  });

  static Route<void> route() => MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const ScanPage(),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = BluetoothAppLocalizations.of(context);
    return ScaffoldMessenger(
      child: BlocConsumer<ScanCubit, ScanState>(
          listenWhen: (previous, current) =>
              previous.isConnected() != current.isConnected(),
          listener: (context, state) async {
            if (state.isConnected()) {
              final message =
                  '${l10n?.bluetoothConnectedTo ?? "Connected to"} ${state.connectedDevice?.device.remoteId}';
              await context.read<ScanCubit>().writeText(message);
            } else {
              final message =
                  l10n?.bluetoothWaitForConnection ?? 'Wait for connection';
              await context.read<ScanCubit>().writeText(message);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar:
                  AppBar(title: Text(l10n?.bluetoothTitle ?? 'TV Connections')),
              body: Column(
                children: [
                  if (state.isConnected())
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            l10n?.bluetoothActiveConnection ??
                                'Now connected to',
                            textAlign: TextAlign.left,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        ListTile(
                          title: Text(
                              '${state.connectedDevice!.device.remoteId} / ${state.connectedDevice!.device.advName}  '),
                          trailing: IconButton(
                            icon: const Icon(Icons.tv_off),
                            onPressed: () {
                              context.read<ScanCubit>().disconnect();
                            },
                          ),
                        ),
                      ],
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            l10n?.bluetoothPossibleConnections ??
                                'Possible connections',
                            style: Theme.of(context).textTheme.labelLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            children: state.scanResults
                                .where((scanResult) =>
                                    scanResult.device !=
                                    state.connectedDevice?.device)
                                .map(
                                  (scanResult) => ListTile(
                                    title: Text(
                                        scanResult.advertisementData.advName),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.connected_tv),
                                      onPressed: () async {
                                        await context
                                            .read<ScanCubit>()
                                            .connect(scanResult.device);
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              floatingActionButton: state.isScanning
                  ? null
                  : FloatingActionButton(
                      child: const Icon(Icons.bluetooth_searching),
                      onPressed: () async {
                        await context.read<ScanCubit>().startScanning();
                      },
                    ),
            );
          }),
    );
  }
}
