import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/state/scan_results_cubit.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child:
          BlocBuilder<ScanResultsCubit, ScanState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Lipl Bluetooth')),
          body: Column(
            children: [
              if (state.connectedDevice != null)
                ListTile(
                  title: Text(
                      'Connected to ${state.connectedDevice!.device.advName} on ${state.connectedDevice!.device.platformName}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.tv_off),
                    onPressed: () {
                      context.read<ScanResultsCubit>().disconnect();
                    },
                  ),
                ),
              Expanded(
                child: ListView(
                  children: state.scanResults
                      .where((scanResult) =>
                          scanResult.device != state.connectedDevice?.device)
                      .map(
                        (scanResult) => ListTile(
                          title: Text(scanResult.advertisementData.advName),
                          trailing: IconButton(
                            icon: const Icon(Icons.connected_tv),
                            onPressed: () async {
                              await context
                                  .read<ScanResultsCubit>()
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
          floatingActionButton: FloatingActionButton(
            child:
                Icon(state.isScanning ? Icons.stop : Icons.bluetooth_searching),
            onPressed: () async {
              state.isScanning
                  ? await context.read<ScanResultsCubit>().stop()
                  : await context.read<ScanResultsCubit>().start();
            },
          ),
        );
      }),
    );
  }
}
