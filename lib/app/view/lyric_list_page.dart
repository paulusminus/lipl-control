import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/edit_lyric/edit_lyric.dart';
import 'package:lipl_control/edit_playlist/edit_playlist.dart';
import 'package:lipl_control/edit_preferences/edit_preferences.dart';
import 'package:lipl_control/info/info.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/play/play.dart';
import 'package:lipl_control/search/search_view.dart';
import 'package:lipl_control/widget/widget.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';

void Function(BuildContext, LiplAppState) onRestUnauthorized(
  AppLocalizations l10n,
) =>
    (BuildContext context, LiplAppState state) {
      if (state.status == LoadingStatus.unauthorized) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.unauthorized),
            action: SnackBarAction(
              label: l10n.preferences,
              onPressed: () {
                Navigator.of(context).push(
                  EditPreferencesPage.route(),
                );
              },
            ),
            duration: const Duration(days: 365),
          ),
        );
      }
    };

class LyricListNoMobile extends StatelessWidget {
  const LyricListNoMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        leading: kIsWeb ? const WebInfoButton() : const PreferencesButton(),
        titleSpacing: 0,
        title: Text(l10n.liplTitle),
        actions: <Widget>[
          const SearchButton(),
          SelectTabButton(),
        ],
      ),
      body: BlocListener<LiplAppCubit, LiplAppState>(
        listenWhen: (LiplAppState previous, LiplAppState current) =>
            current.status != previous.status,
        listener: onRestUnauthorized(l10n),
        child: const LyricsOrPlaylistsView(),
      ),
      floatingActionButton: const AddNewFloatingActionButton(),
    );
  }
}

class LyricListMobile extends StatelessWidget {
  const LyricListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;

    return Scaffold(
      appBar: AppBar(
        leading: kIsWeb ? const Icon(Icons.home) : const PreferencesButton(),
        title: Text(l10n.liplTitle),
        actions: <Widget>[
          const RefreshIconButton(),
          const SearchButton(),
          const BluetoothIndicator(),
          SelectTabButton(),
        ],
      ),
      body: const LyricsOrPlaylistsView(),
    );
  }
}

class LyricsOrPlaylistsView extends StatelessWidget {
  const LyricsOrPlaylistsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lyrics = context
        .select<LiplAppCubit, List<Lyric>>((cubit) => cubit.state.lyrics);
    return BlocBuilder<SelectedTabCubit, SelectedTab>(
      builder: (BuildContext context, SelectedTab selectedTab) {
        return IndexedStack(
          index: selectedTab.index,
          children: <Widget>[
            LyricList(
              lyrics: lyrics,
            ),
            const PlaylistList(),
          ],
        );
      },
    );
  }
}

String selectLyricId(Lyric lyric) => lyric.id!;

Widget renderLyricTitle(Lyric lyric) => ListTile(
      title: Text(lyric.title),
      leading: const Icon(Icons.text_snippet_rounded),
    );

Widget renderLyricSummary(Lyric lyric) => ListTile(
      subtitle: Text(
        lyric.parts
            .map(
              (List<String> part) => part.first,
            )
            .join('\n'),
      ),
    );

String selectPlaylistId(Playlist playlist) => playlist.id!;

Widget renderPlaylistTitle(Playlist playlist) => ListTile(
      title: Text(playlist.title),
      leading: const Icon(Icons.folder),
    );

Widget renderPlaylistSummary(
  BuildContext context,
  Playlist playlist,
  List<Lyric> lyrics,
) {
  final AppLocalizations l10n = context.l10n;
  return ListTile(
    title: Text(l10n.lyrics),
    subtitle: Text(
      playlist.members
          .map(
            (String member) => lyrics.cast<Lyric?>().firstWhere(
                (Lyric? lyric) => lyric?.id == member,
                orElse: () => null),
          )
          .where(
            (Lyric? lyric) => lyric != null,
          )
          .map((Lyric? lyric) => lyric!.title)
          .join('\n'),
    ),
  );
}

class BluetoothIndicator extends StatelessWidget {
  const BluetoothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScanCubit, ScanState>(
      builder: (BuildContext context, ScanState state) => IconButton(
          onPressed: () async {
            final scanResultsCubit = context.read<ScanCubit>();
            final NavigatorState navigator = Navigator.of(context);
            await scanResultsCubit.startScanning();
            await navigator.push(
              ScanPage.route(),
            );
            await scanResultsCubit.stopScanning();
          },
          icon: Icon(
            state.connectedDevice != null
                ? Icons.bluetooth_connected
                : Icons.bluetooth,
          )),
    );
  }
}

class SelectTabButton extends StatelessWidget {
  SelectTabButton({super.key});

  final Map<SelectedTab, IconData> whichIcon = <SelectedTab, IconData>{
    SelectedTab.lyrics: Icons.folder,
    SelectedTab.playlists: Icons.text_snippet,
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTabCubit, SelectedTab>(
        builder: (BuildContext context, SelectedTab state) {
      return IconButton(
        onPressed: () {
          if (state == SelectedTab.lyrics) {
            context.read<SelectedTabCubit>().selectPlaylists();
          }
          if (state == SelectedTab.playlists) {
            context.read<SelectedTabCubit>().selectLyrics();
          }
        },
        icon: Icon(
          whichIcon[state],
        ),
      );
    });
  }
}

class RefreshIconButton extends StatelessWidget {
  const RefreshIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiplAppCubit, LiplAppState>(
      builder: (BuildContext context, LiplAppState liplAppState) {
        return IconButton(
          onPressed: liplAppState.status == LoadingStatus.loading
              ? null
              : () async {
                  await context.read<LiplAppCubit>().load();
                },
          icon: const Icon(Icons.refresh),
        );
      },
    );
  }
}

class AddNewFloatingActionButton extends StatelessWidget {
  const AddNewFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectedTabCubit, SelectedTab>(
      builder: (BuildContext context, SelectedTab state) {
        return FloatingActionButton(
          onPressed: () {
            if (state == SelectedTab.lyrics) {
              Navigator.of(context).push(
                EditLyricPage.route(),
              );
            }
            if (state == SelectedTab.playlists) {
              Navigator.of(context).push(
                EditPlaylistPage.route(),
              );
            }
          },
          child: const Icon(Icons.add),
        );
      },
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LiplAppCubit, LiplAppState>(
      builder: (BuildContext context, LiplAppState state) {
        return state.lyrics.length > 20
            ? IconButton(
                onPressed: () {
                  Navigator.of(context).push(SearchPage.route());
                },
                icon: const Icon(Icons.search))
            : const SizedBox.shrink();
      },
    );
  }
}

class PreferencesButton extends StatelessWidget {
  const PreferencesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(EditPreferencesPage.route());
      },
      icon: const Icon(Icons.settings),
    );
  }
}

class WebInfoButton extends StatelessWidget {
  const WebInfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).push(InfoPage.route());
      },
      icon: const Icon(Icons.info),
    );
  }
}

class LyricList extends StatelessWidget {
  const LyricList({required this.lyrics, super.key});
  final List<Lyric> lyrics;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    final LiplAppCubit liplAppCubit = context.read<LiplAppCubit>();
    final NavigatorState navigator = Navigator.of(context);
    final scanCubit = context.read<ScanCubit>();
    return expansionPanelList<Lyric>(
      items: lyrics,
      selectId: selectLyricId,
      selectTitle: renderLyricTitle,
      selectSummary: renderLyricSummary,
      buttons: <ButtonData<Lyric>>[
        ButtonData<Lyric>(
          label: l10n.playButtonLabel,
          onPressed: (Lyric lyric) async {
            await navigator.push(
              PlayPage.route(
                lyricParts: <Lyric>[lyric].toLyricParts(),
                title: lyric.title,
              ),
            );
            if (scanCubit.state.isConnected()) {
              await scanCubit.writeCommand('?');
            }
          },
          enabled: (Lyric lyric) => lyric.parts.isNotEmpty,
          showOnMobile: true,
        ),
        ButtonData<Lyric>(
          label: l10n.deleteButtonLabel,
          onPressed: (Lyric lyric) {
            confirm(
              context,
              title: l10n.confirm,
              content: '${l10n.delete} "${lyric.title}"?',
              textOK: l10n.okButtonLabel,
              textCancel: l10n.cancelButtonLabel,
            ).then((result) => {
                  if (result) {liplAppCubit.deleteLyric(lyric.id!)}
                });
          },
          showOnMobile: false,
        ),
        ButtonData<Lyric>(
          label: l10n.editButtonLabel,
          onPressed: (Lyric lyric) {
            navigator.push(
              EditLyricPage.route(lyric: lyric),
            );
          },
          showOnMobile: false,
        ),
      ]
          .where(
              (buttonData) => context.isMobile ? buttonData.showOnMobile : true)
          .toList(),
    );
  }
}

class PlaylistList extends StatelessWidget {
  const PlaylistList({super.key});

  @override
  Widget build(BuildContext context) {
    final playlists = context
        .select<LiplAppCubit, List<Playlist>>((cubit) => cubit.state.playlists);
    final lyrics = context
        .select<LiplAppCubit, List<Lyric>>((cubit) => cubit.state.lyrics);
    final AppLocalizations l10n = context.l10n;
    final NavigatorState navigator = Navigator.of(context);
    final scanCubit = context.read<ScanCubit>();

    return expansionPanelList<Playlist>(
      items: playlists,
      selectId: selectPlaylistId,
      selectTitle: renderPlaylistTitle,
      selectSummary: (Playlist playlist) =>
          renderPlaylistSummary(context, playlist, lyrics),
      buttons: <ButtonData<Playlist>>[
        ButtonData<Playlist>(
          label: l10n.playButtonLabel,
          onPressed: (Playlist playlist) async {
            await navigator.push(
              PlayPage.route(
                lyricParts: playlist.members
                    .map(
                      (String id) => lyrics.cast<Lyric?>().firstWhere(
                            (Lyric? lyric) => lyric?.id == id,
                            orElse: () => null,
                          ),
                    )
                    .where(
                      (Lyric? lyric) => lyric != null,
                    )
                    .cast<Lyric>()
                    .toList()
                    .toLyricParts(),
                title: playlist.title,
              ),
            );
            if (scanCubit.state.isConnected()) {
              await scanCubit.writeCommand('?');
            }
          },
          enabled: (Playlist playlist) => playlist.members.isNotEmpty,
          showOnMobile: true,
        ),
        ButtonData<Playlist>(
          label: l10n.deleteButtonLabel,
          onPressed: (Playlist playlist) async {
            final LiplAppCubit liplRestCubit = context.read<LiplAppCubit>();
            final confirmDialog = confirm(
              context,
              title: l10n.confirm,
              content: '${l10n.delete} "${playlist.title}"?',
              textOK: l10n.okButtonLabel,
              textCancel: l10n.cancelButtonLabel,
            );
            if (await confirmDialog) {
              await liplRestCubit.deletePlaylist(playlist.id!);
            }
          },
          showOnMobile: false,
        ),
        ButtonData<Playlist>(
          label: l10n.editButtonLabel,
          onPressed: (Playlist playlist) {
            navigator.push(
              EditPlaylistPage.route(
                id: playlist.id,
                title: playlist.title,
                members: playlist.members
                    .map(
                      (String lyricId) => lyrics.cast<Lyric?>().firstWhere(
                            (Lyric? lyric) => lyric?.id == lyricId,
                            orElse: () => null,
                          ),
                    )
                    .where((Lyric? lyric) => lyric != null)
                    .cast<Lyric>()
                    .toList(),
              ),
            );
          },
          showOnMobile: false,
        ),
      ]
          .where(
              (buttonData) => context.isMobile ? buttonData.showOnMobile : true)
          .toList(),
    );
  }
}
