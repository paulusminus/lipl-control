import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:lipl_control/app/view/providers.dart';
import 'package:lipl_control/bloc_observer.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (LogRecord record) {
      // ignore: avoid_print
      print(
        '${record.level.name}: ${record.time}: ${record.message}',
      );
    },
  );

  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();

  if (kDebugMode) {
    Bloc.observer = LiplBlocObserver();
  }

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationSupportDirectory(),
  );

  runApp(
    BlocProviders(
      packageInfo: packageInfo,
    ),
  );
}
