import 'dart:async';
import 'dart:io';

import 'package:environment/environment.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:logging/logging.dart';

final Logger log = Logger('lipl_repo_stream_example');

Credentials credentials = Credentials(
  username: username(),
  password: password(),
);

String selectTitle(Summary summary) => summary.title;

String joinTitles(List<Summary> summaries) =>
    summaries.map(selectTitle).join(', ');

bool isSuccess(LiplAppState state) => state.status == LoadingStatus.success;

void Function(List<Lyric>) printLyricTitles(String itemType) => (summaries) {
      log.info('$itemType: ${summaries.length} titles');
    };

void Function(List<Playlist>) printPlaylistTitles(String itemType) =>
    (summaries) {
      log.info('$itemType: ${summaries.length} titles');
    };

List<Lyric> selectLyrics(LiplAppState state) => state.lyrics;
List<Playlist> selectPlaylists(LiplAppState state) => state.playlists;

Future<void> main() async {
  Logger.root.level = Level.ALL;
  log.onRecord.listen((record) {
    stdout.writeln('${record.level.name}: ${record.time}: ${record.message}');
  });
  final LiplAppCubit cubit = LiplAppCubit();

  final StreamSubscription<List<Lyric>> subscription1 = cubit.stream
      .where(isSuccess)
      .map(selectLyrics)
      .distinct()
      .listen(printLyricTitles('Lyric'));
  final StreamSubscription<List<Playlist>> subscription2 = cubit.stream
      .where(isSuccess)
      .map(selectPlaylists)
      .distinct()
      .listen(printPlaylistTitles('Playlist'));

  log.info('Loading');
  await cubit.load();

  log.info('Adding Allegaartje');
  final Playlist playlistPost = Playlist(
    id: newId(),
    title: 'Allegaartje',
    members: [
      'EqCnuUKcSkoWPyvaRK8Jbh',
      'LEt7kAx8sAjPmrAKuwkH8S',
      'HvBRBoaHh4rNsWVJgZNRvY',
    ],
  );
  await cubit.postPlaylist(playlistPost);
  log.info('Added Allegaartje');

  final Playlist p = cubit.state.playlists
      .firstWhere((Playlist playlist) => playlist.title == 'Allegaartje');

  log.info('Renaming Allegaartje');
  await cubit.putPlaylist(
    p.copyWith(title: 'Allemaal te gek'),
  );

  log.info('Renamed Allegaartje to Allemaal te gek');

  log.info('Deleting playlist');
  await cubit.deletePlaylist(p.id!);
  log.info('Deleted playlist');

  final lyricPost = Lyric(
    id: newId(),
    title: 'Leningrad 19',
    parts: [
      [
        'Victor was born',
        'in spring of 44',
        'and never saw',
        'his father anymore',
        'the greatest sacrifice'
      ],
      [
        'I was born in 49',
        'a cold war kid in McCarthy time',
        'stop them at the 38 parallel',
        'blast those to hell'
      ],
    ],
  );

  log.info('Adding Lyric Leningrad');
  await cubit.postLyric(lyricPost);
  log.info('Added Leningrad');

  final l = cubit.state.lyrics
      .firstWhere((Lyric lyric) => lyric.title == 'Leningrad 19');

  log.info('Renaming Leningrad 19');
  await cubit.putLyric(
    l.copyWith(title: 'Leningrad 44'),
  );
  log.info('Renamed Leningrad 19 to Leningrad 44');

  log.info('Deleting lyric');
  await cubit.deleteLyric(l.id!);
  log.info('Deleted lyric');

  await subscription1.cancel();
  await subscription2.cancel();
  await cubit.close();

  log.info('Finished');
}
