import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_ble/lipl_ble.dart';
import 'package:lipl_control/l10n/l10n.dart';

class SelectDisplayServerPage extends StatelessWidget {
  const SelectDisplayServerPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const SelectDisplayServerPage(),
      );

  @override
  Widget build(BuildContext context) => const SelectDisplayServerView();
}

class SelectDisplayServerView extends StatelessWidget {
  const SelectDisplayServerView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;

    return BlocBuilder<BleScanCubit, BleScanState>(
      builder: (BuildContext context, BleScanState state) => Scaffold(
        appBar: AppBar(
          title: Text(l10n.selectDisplayServerTitle),
        ),
        body: ListView(
          children: state.devices
              .map(
                // ignore: always_specify_types
                (device) => BlocBuilder<BleConnectionCubit, BleConnectionState>(
                  builder: (BuildContext context,
                      BleConnectionState connectionState) {
                    final BleScanCubit bleScanCubit =
                        context.read<BleScanCubit>();
                    final NavigatorState navigator = Navigator.of(context);
                    return ListTile(
                      title: Text(device.name),
                      subtitle: Text(device.id),
                      trailing: state.selectedDevice?.id == device.id
                          ? const CurrentSelectedConnectionButton()
                          : TextButton(
                              onPressed: () async {
                                bleScanCubit.select(device);
                                await bleScanCubit.stop();

                                navigator.pop();
                              },
                              child: const Text('Connect'),
                            ),
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CurrentSelectedConnectionButton extends StatelessWidget {
  const CurrentSelectedConnectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final BleScanCubit bleScanCubit = context.read<BleScanCubit>();
    return BlocBuilder<BleConnectionCubit, BleConnectionState>(
      builder: (BuildContext context, BleConnectionState state) => TextButton(
        onPressed: state.isConnected
            ? () async {
                bleScanCubit.select(null);
              }
            : null,
        child: Text(state.isConnected ? 'Disconnect' : 'Connecting'),
      ),
    );
  }
}
