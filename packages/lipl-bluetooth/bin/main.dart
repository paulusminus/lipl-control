import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';
import 'package:logging/logging.dart';

class LiplBlocObserver extends BlocObserver {
  LiplBlocObserver({required this.logger});
  final Logger logger;

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
  const BluetoothProviders({super.key, required this.logger});
  final Logger logger;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ScanResultsCubit>.value(
          value: ScanResultsCubit(logger: logger),
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
  final logger = Logger('Lipl');
  Bloc.observer = LiplBlocObserver(logger: logger);
  runApp(BluetoothProviders(logger: logger));
}
