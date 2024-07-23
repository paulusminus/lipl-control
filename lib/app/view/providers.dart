import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/edit_preferences/edit_preferences.dart';
import 'package:lipl_control/info/info.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/play/play.dart';
import 'package:lipl_control/search/search.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_io/io.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainPage(),
    ),
    GoRoute(
      path: '/preferences',
      builder: (context, state) => const EditPreferencesView(),
    ),
    // GoRoute(
    //   path: 'lyric/edit/:id',
    //   builder: (context, state) => const EditLyricView(),
    // ),
    // GoRoute(
    //   path: 'lyric/new',
    //   builder: (context, state) => const EditLyricView(),
    // ),
    GoRoute(
      path: 'lyric/search',
      builder: (context, state) => const SearchPage(),
    ),
    // GoRoute(
    //   path: 'playlist/edit/:id',
    //   builder: (context, state) => const EditPlaylistView(),
    // ),
    // GoRoute(
    //   path: 'playlist/new',
    //   builder: (context, state) => const EditPlaylistView(),
    // ),
    GoRoute(
      path: 'bluetooth',
      builder: (context, state) => const ScanPage(),
    ),
    GoRoute(
      path: 'play/lyric/:id',
      builder: (context, state) {
        final appState = context.read<LiplAppCubit>().state;
        final lyricId = state.pathParameters['id']!;
        final lyric = appState.findLyric(lyricId)!;
        return PlayPage(lyricParts: lyric.toLyricParts(), title: lyric.title);
      },
    ),
    GoRoute(
      path: 'play/playlist/:id',
      builder: (context, state) {
        final appState = context.read<LiplAppCubit>().state;
        final String playlistId = state.pathParameters['id']!;
        final playlist = appState.findPlaylist(playlistId)!;
        final lyrics = appState.lyricMembers(playlist);
        final lyricParts =
            lyrics.expand((lyric) => lyric.toLyricParts()).toList();
        return PlayPage(lyricParts: lyricParts, title: playlist.title);
      },
    ),
    GoRoute(path: 'info', builder: (context, state) => const InfoPage()),
  ],
);

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
    return MaterialApp.router(
      routerConfig: _router,
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
      // home: BlocBuilder<LiplAppCubit, LiplAppState>(
      //   builder: (context, liplAppState) => liplAppState.credentials == null
      //       ? const EditPreferencesView()
      //       : context.isMobile
      //           ? const LyricListMobile()
      //           : const LyricListNoMobile(),
      // ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(context) => BlocBuilder<LiplAppCubit, LiplAppState>(
        builder: (context, liplAppState) => liplAppState.credentials == null
            ? const EditPreferencesView()
            : context.isMobile
                ? const LyricListMobile()
                : const LyricListNoMobile(),
      );
}
