import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/edit_preferences/edit_preferences.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/search/search_cubit.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

extension ContextExtension on BuildContext {
  bool get isMobile => Platform.isAndroid || Platform.isIOS;
}

class BlocProviders extends StatelessWidget {
  const BlocProviders(
      {required this.packageInfo,
      required this.applicationSupportDirectory,
      super.key});
  final PackageInfo packageInfo;
  final Directory? applicationSupportDirectory;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PackageInfo>(
      create: (context) => packageInfo,
      child: MultiBlocProvider(
        providers: <BlocProvider<dynamic>>[
          BlocProvider<ScanCubit>(
            create: (_) => ScanCubit(),
          ),
          BlocProvider<EditPreferencesCubit>(
            create: (_) => EditPreferencesCubit(),
          ),
          BlocProvider<LiplAppCubit>(
            create: (_) => LiplAppCubit(
                applicationSupportDirectory: applicationSupportDirectory),
          ),
          BlocProvider<SelectedTabCubit>(
            create: (_) => SelectedTabCubit(),
          ),
          BlocProvider<SearchCubit>(
            create: (_) => SearchCubit(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lipl',
      themeMode: ThemeMode.dark,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        BluetoothAppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('nl'),
      ],
      home: BlocBuilder<LiplAppCubit, LiplAppState>(
        builder: (context, liplAppState) => liplAppState.credentials == null
            ? const EditPreferencesView()
            : context.isMobile
                ? const LyricListMobile()
                : const LyricListNoMobile(),
      ),
    );
  }
}
