import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lipl_control/app/view/providers.dart';
import 'package:lipl_control/bloc_observer.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (LogRecord record) {
      stdout.writeln(
        '${record.level.name}: ${record.time}: ${record.message}',
      );
    },
  );

  WidgetsFlutterBinding.ensureInitialized();

  final Logger logger = Logger('Lipl');

  Bloc.observer = LiplBlocObserver(kDebugMode ? logger : null);
  runApp(
    RepoProviders(
      logger: logger,
    ),
  );
}
