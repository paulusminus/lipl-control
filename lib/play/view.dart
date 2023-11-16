import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_bluetooth/state/scan_results_cubit.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/widget/confirm.dart';
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
        builder: (_) => PlayPage(
          lyricParts: lyricParts,
          title: title,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return PlayPart(
      title: title,
      lyricParts: lyricParts,
    );
  }
}

Future<void> Function(int) createUpdatePage(
  ScanResultsCubit cubit,
  List<LyricPart> lyricParts,
) {
  return (int page) async {
    final LyricPart part = lyricParts[page];
    await cubit.writeText(part.text);
    await cubit.writeStatus('${part.title} (${part.current} / ${part.total})');
  };
}

Future<void> updateCommand(ScanResultsCubit cubit, String command) async {
  await cubit.writeCommand(command);
}

class PlayPart extends StatelessWidget {
  const PlayPart({super.key, required this.title, required this.lyricParts});
  final String title;
  final List<LyricPart> lyricParts;

  List<PopupMenuItem<String>> buildCommandMenu(AppLocalizations l10n) {
    return <PopupMenuItem<String>>[
      PopupMenuItem<String>(
        value: 'd',
        child: Text(l10n.dark),
      ),
      PopupMenuItem<String>(
        value: 'l',
        child: Text(l10n.light),
      ),
      PopupMenuItem<String>(
        value: '+',
        child: Text(l10n.bigger),
      ),
      PopupMenuItem<String>(
        value: '-',
        child: Text(l10n.smaller),
      ),
      PopupMenuItem<String>(
        value: 'o',
        child: Text(l10n.poweroff),
      ),
    ];
  }

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
    final FirstIntent homeIntent = FirstIntent();
    final LastIntent endIntent = LastIntent();
    final CloseIntent closeIntent = CloseIntent();

    final ScanResultsCubit scanResultsCubit = context.read<ScanResultsCubit>();
    final Logger logger = RepositoryProvider.of<Logger>(context);
    Future<void> Function(int) updatePage =
        createUpdatePage(scanResultsCubit, lyricParts);
    updatePage(0);

    return Shortcuts(
      shortcuts: <SingleActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.arrowLeft): previousIntent,
        const SingleActivator(LogicalKeyboardKey.arrowRight): nextIntent,
        const SingleActivator(LogicalKeyboardKey.home): homeIntent,
        const SingleActivator(LogicalKeyboardKey.end): endIntent,
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
          child: BlocBuilder<ScanResultsCubit, ScanState>(
            builder: (BuildContext context, ScanState state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                  actions: <Widget>[
                    if (state.isConnected())
                      PopupMenuButton<String>(
                        itemBuilder: (BuildContext _) => buildCommandMenu(l10n),
                        onSelected: (String command) async {
                          if (command == 'o') {
                            final result = await confirm(
                              context,
                              title: l10n.poweroff,
                              content: l10n.confirmPoweroff,
                              textOK: l10n.okButtonLabel,
                              textCancel: l10n.cancelButtonLabel,
                            );
                            if (result) {
                              await updateCommand(scanResultsCubit, command);
                              logger.info('Command $command processed');
                            }
                          } else {
                            await updateCommand(scanResultsCubit, command);
                            logger.info('Command $command processed');
                          }
                        },
                        icon: const Icon(Icons.settings_display),
                      ),
                  ],
                ),
                body: PageView(
                  controller: controller,
                  onPageChanged: (int page) async {
                    await updatePage(page);
                  },
                  children: buildPageViewChildren(),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: Colors.grey.shade200,
                  fixedColor: Colors.black,
                  unselectedItemColor: Colors.black,
                  showUnselectedLabels: true,
                  onTap: (int index) {
                    Function()? createHandler<T extends Intent>(T t) =>
                        Actions.handler<T>(context, t);
                    <Function()?>[
                      createHandler(homeIntent),
                      createHandler(previousIntent),
                      createHandler(nextIntent),
                      createHandler(endIntent),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
