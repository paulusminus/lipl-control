import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/lipl_bluetooth.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/play/play.dart';
import 'package:lipl_control/widget/confirm.dart';
import 'package:lipl_control/widget/widget.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:logging/logging.dart';

class PreviousIntent extends Intent {}

class PreviousAction extends Action<PreviousIntent> {
  PreviousAction(this.controller);
  final PageController controller;
  @override
  Object? invoke(PreviousIntent intent) async {
    await controller.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    return null;
  }
}

class NextIntent extends Intent {}

class NextAction extends Action<NextIntent> {
  NextAction(this.controller);
  final PageController controller;

  @override
  Object? invoke(NextIntent intent) async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    return null;
  }
}

class FirstIntent extends Intent {}

class FirstAction extends Action<FirstIntent> {
  FirstAction(this.controller);
  final PageController controller;

  @override
  Object? invoke(FirstIntent intent) async {
    await controller.animateToPage(0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    return null;
  }
}

class LastIntent extends Intent {}

class LastAction extends Action<LastIntent> {
  LastAction(this.controller, this.count);
  final PageController controller;
  final int count;

  @override
  Object? invoke(LastIntent intent) async {
    await controller.animateToPage(
      count - 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    return null;
  }
}

class CloseIntent extends Intent {}

class CloseAction extends Action<CloseIntent> {
  CloseAction(this.context);
  final BuildContext context;

  @override
  Object? invoke(CloseIntent intent) {
    Navigator.of(context).pop();
    return null;
  }
}

class PlayPage extends StatelessWidget {
  const PlayPage({
    super.key,
    required this.lyricParts,
    required this.title,
  });
  final String title;
  final List<LyricPart> lyricParts;

  static Route<void> route({
    required List<LyricPart> lyricParts,
    required String title,
  }) =>
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => BlocProvider<PlayTabCubit>(
          create: (context) => PlayTabCubit(),
          child: PlayPage(
            lyricParts: lyricParts,
            title: title,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PlayPart(
      title: title,
      lyricParts: lyricParts,
      onSendCommand: createSendCommand(context.read<ScanCubit>()),
      onUpdatePage: createUpdatePage(context.read<ScanCubit>()),
      connected: context.read<ScanCubit>().state.isConnected(),
    );
  }
}

Future<void> Function(int, List<LyricPart>) createUpdatePage(
  ScanCubit cubit,
) {
  return (int page, List<LyricPart> lyricParts) async {
    final LyricPart part = lyricParts[page];
    await cubit.writeText(part.text);
    await cubit.writeStatus('${part.title} (${part.current} / ${part.total})');
  };
}

Future<void> Function(String) createSendCommand(ScanCubit cubit) {
  return (String command) async {
    await cubit.writeCommand(command);
  };
}

class PlayPart extends StatelessWidget {
  const PlayPart({
    super.key,
    required this.title,
    required this.lyricParts,
    required this.onSendCommand,
    required this.onUpdatePage,
    required this.connected,
  });
  final String title;
  final List<LyricPart> lyricParts;
  final Future<void> Function(String) onSendCommand;
  final Future<void> Function(int, List<LyricPart>) onUpdatePage;
  final bool connected;

  List<Center> buildPageViewChildren() {
    return lyricParts
        .map(
          (LyricPart lyricPart) => Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: RichText(
                text: TextSpan(
                  text: lyricPart.text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.2,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          '\n\n\n${lyricPart.title} (${lyricPart.current} / ${lyricPart.total})',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    final PageController controller = PageController();

    final PreviousIntent previousIntent = PreviousIntent();
    final NextIntent nextIntent = NextIntent();
    final FirstIntent firstIntent = FirstIntent();
    final LastIntent lastIntent = LastIntent();
    final CloseIntent closeIntent = CloseIntent();

    final Logger logger = RepositoryProvider.of<Logger>(context);
    onUpdatePage(0, lyricParts);

    return Shortcuts(
      shortcuts: <SingleActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): previousIntent,
        const SingleActivator(LogicalKeyboardKey.arrowRight): nextIntent,
        const SingleActivator(LogicalKeyboardKey.home): firstIntent,
        const SingleActivator(LogicalKeyboardKey.end): lastIntent,
        const SingleActivator(LogicalKeyboardKey.escape): closeIntent,
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          PreviousIntent: PreviousAction(controller),
          NextIntent: NextAction(controller),
          FirstIntent: FirstAction(controller),
          LastIntent: LastAction(controller, lyricParts.length),
          CloseIntent: CloseAction(context),
        },
        child: Focus(
          autofocus: true,
          child: BlocBuilder<PlayTabCubit, PlayTab>(
            builder: (context, tabState) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                  actions: <Widget>[
                    if (connected)
                      IconButton(
                          onPressed: tabState == PlayTab.play
                              ? () {
                                  context.read<PlayTabCubit>().selectTv();
                                }
                              : () {
                                  context.read<PlayTabCubit>().selectPlay();
                                },
                          icon: tabState == PlayTab.play
                              ? const Icon(Icons.tv)
                              : const Icon(Icons.playlist_play))
                  ],
                ),
                body: IndexedStack(
                  index: tabState.index,
                  children: [
                    PageView(
                      controller: controller,
                      onPageChanged: (int page) async {
                        await onUpdatePage(page, lyricParts);
                      },
                      children: buildPageViewChildren(),
                    ),
                    GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        TextButton(
                          onPressed: () async {
                            await onSendCommand('d');
                          },
                          child: Text(
                            l10n.dark,
                            style: const TextStyle(
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await onSendCommand('l');
                          },
                          child: Text(
                            l10n.light,
                            style: const TextStyle(
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await onSendCommand('+');
                          },
                          child: Text(
                            l10n.bigger,
                            style: const TextStyle(
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            await onSendCommand('-');
                          },
                          child: Text(
                            l10n.smaller,
                            style: const TextStyle(
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            final result = await confirm(
                              context,
                              title: l10n.poweroff,
                              content: l10n.confirmPoweroff,
                              textOK: l10n.okButtonLabel,
                              textCancel: l10n.cancelButtonLabel,
                            );
                            if (result) {
                              await onSendCommand('o');
                              logger.info('Command poweroff processed');
                            }
                          },
                          child: Text(
                            l10n.poweroff,
                            style: const TextStyle(
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                bottomNavigationBar: tabState == PlayTab.play
                    ? BottomNavigationBar(
                        backgroundColor: Colors.grey.shade200,
                        fixedColor: Colors.black,
                        unselectedItemColor: Colors.black,
                        showUnselectedLabels: true,
                        onTap: (int index) {
                          Function()? createHandler<T extends Intent>(T t) =>
                              Actions.handler<T>(context, t);
                          <Function()?>[
                            createHandler(firstIntent),
                            createHandler(previousIntent),
                            createHandler(nextIntent),
                            createHandler(lastIntent),
                          ][index]
                              ?.call();
                        },
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.first_page),
                            label: l10n.first,
                          ),
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.keyboard_arrow_left),
                            label: l10n.previous,
                          ),
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.keyboard_arrow_right),
                            label: l10n.next,
                          ),
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.last_page),
                            label: l10n.last,
                          ),
                        ],
                      )
                    : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
