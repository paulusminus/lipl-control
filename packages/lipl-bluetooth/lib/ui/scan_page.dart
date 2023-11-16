import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/state/scan_results_cubit.dart';

class ScanPage extends StatelessWidget {
  const ScanPage(
      {super.key, required this.title, required this.connectedToMessage});
  final String title;
  final String connectedToMessage;

  static Route<void> route(String title, String connectedToMessage) =>
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => ScanPage(
          title: title,
          connectedToMessage: connectedToMessage,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child:
          BlocBuilder<ScanResultsCubit, ScanState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Column(
            children: [
              if (state.connectedDevice != null)
                ListTile(
                  title: Text(
                      '$connectedToMessage ${state.connectedDevice!.device.remoteId} / ${state.connectedDevice!.device.advName}  '),
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
                  ? await context.read<ScanResultsCubit>().stopScanning()
                  : await context.read<ScanResultsCubit>().startScanning();
            },
          ),
        );
      }),
    );
  }
}
