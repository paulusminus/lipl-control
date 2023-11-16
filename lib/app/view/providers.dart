import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lipl_bluetooth/state/scan_results_cubit.dart';
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/search/search_cubit.dart';
import 'package:lipl_encrypt/lipl_encrypt.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:loading_status/loading_status.dart';
import 'package:logging/logging.dart';
import 'package:preferences_bloc/preferences_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart';

extension ContextExtension on BuildContext {
  bool get isMobile => Platform.isAndroid || Platform.isIOS;
}

class LiplPreferencesBloc extends PreferencesBloc<LiplPreferences> {
  LiplPreferencesBloc()
      : super(
            persist: PersistSharedPreferences<LiplPreferences>(
                deserialize: LiplPreferences.deserialize,
                serialize: (LiplPreferences preferences) =>
                    preferences.serialize(),
                key: '$LiplPreferences',
                encrypter: kIsWeb ? null : FernetEncrypter()));
}

class LiplEditPreferencesBloc extends EditPreferencesBloc<LiplPreferences> {
  LiplEditPreferencesBloc({
    required super.changes,
    required super.defaultValue,
  });
}

class PersistSharedPreferences<T> implements Persist<T> {
  PersistSharedPreferences({
    required this.key,
    required this.deserialize,
    required this.serialize,
    this.encrypter,
  });
  final String key;
  final T Function(String) deserialize;
  final String Function(T) serialize;
  final EncrypterBase? encrypter;

  @override
  Future<T?> load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final String? s = preferences.getString(key);
    if (s == null) {
      return null;
    } else {
      final String decripted = encrypter?.decrypt(s) ?? s;
      return deserialize(decripted);
    }
  }

  @override
  Future<void> save(T? t) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (t == null) {
      preferences.remove(key);
    } else {
      final String s = serialize(t);
      final String encrypted = encrypter?.encrypt(s) ?? s;
      await preferences.setString(key, encrypted);
    }
  }
}

class RepoProviders extends StatelessWidget {
  const RepoProviders({super.key, required this.logger});
  final Logger logger;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: <RepositoryProvider<Object>>[
        RepositoryProvider<Logger>(
          create: (_) => logger,
        ),
      ],
      child: BlocProviders(logger: logger),
    );
  }
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key, required this.logger});
  final Logger logger;

  @override
  Widget build(BuildContext context) {
    final scanResultCubit = ScanResultsCubit(logger: logger);

    final preferencesBloc = LiplPreferencesBloc()
      ..add(PreferencesEventLoad<LiplPreferences>());

    final editPreferencesBloc = LiplEditPreferencesBloc(
        changes: preferencesBloc.stream,
        defaultValue: LiplPreferences.blank(context.isMobile));

    final liplRestCubit = LiplAppCubit(
      credentialsStream: preferencesBloc.stream
          .where((state) => state.status == LoadingStatus.success)
          .map((state) => state.item)
          .map(
            (item) => item?.credentials,
          ),
    );

    final searchCubit = SearchCubit(
      lyricsStream: liplRestCubit.lyricsStream,
    );
    final selectTabCubit = SelectedTabCubit();
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ScanResultsCubit>.value(
          value: scanResultCubit,
        ),
        BlocProvider<LiplPreferencesBloc>.value(
          value: preferencesBloc,
        ),
        BlocProvider<LiplEditPreferencesBloc>.value(
          value: editPreferencesBloc,
        ),
        BlocProvider<LiplAppCubit>.value(
          value: liplRestCubit,
        ),
        BlocProvider<SelectedTabCubit>.value(
          value: selectTabCubit,
        ),
        BlocProvider<SearchCubit>.value(
          value: searchCubit,
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lipl',
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('nl'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: context.isMobile
          ? const LyricListMobile()
          : const LyricListNoMobile(),
    );
  }
}
