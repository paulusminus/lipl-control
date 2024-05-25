import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';
import 'package:logging/logging.dart';

final logger = Logger('Lipl');

class LiplBlocObserver extends BlocObserver {
  LiplBlocObserver();

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);
    logger.info('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    final dynamic next = change.nextState;
    logger.info(next.runtimeType);
    logger.info('onChange -- ${bloc.runtimeType}\n\n$change\n');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.info('onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    logger.info('onClose -- ${bloc.runtimeType}');
  }
}

class BluetoothProviders extends StatelessWidget {
  const BluetoothProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScanCubit>.value(
          value: ScanCubit(),
        )
      ],
      child: const LiplBluetoothApp(),
    );
  }
}

class LiplBluetoothApp extends StatelessWidget {
  const LiplBluetoothApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Lipl Bluetooth',
      home: ScanPage(),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord record) {
    stdout.writeln('${record.level.name}: ${record.time}: ${record.message}');
  });

  Bloc.observer = LiplBlocObserver();
  runApp(const BluetoothProviders());
}
