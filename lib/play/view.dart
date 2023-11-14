import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_ble/lipl_ble.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/widget/confirm.dart';
import 'play.dart';

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

class HomeIntent extends Intent {}

class HomeAction extends Action<HomeIntent> {
  HomeAction(this.controller);
  final PageController controller;

  @override
  Object? invoke(HomeIntent intent) async {
    await controller.animateToPage(0,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
    return null;
  }
}

class EndIntent extends Intent {}

class EndAction extends Action<EndIntent> {
  EndAction(this.controller, this.count);
  final PageController controller;
  final int count;

  @override
  Object? invoke(EndIntent intent) async {
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

class PlayPage extends StatefulWidget {
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
  }) {
    return MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (BuildContext context) {
        final bool connected =
            context.read<BleConnectionCubit>().state.isConnected;
        if (connected) {
          updatePage(context, lyricParts)(0);
        }
        return PlayPage(
          lyricParts: lyricParts,
          title: title,
        );
      },
    );
  }

  @override
  State<StatefulWidget> createState() => _PlayPageState();
}

void Function(int) updatePage(
    BuildContext context, List<LyricPart> lyricParts) {
  return (int page) {
    final BleConnectionCubit cubit = context.read<BleConnectionCubit>();
    if (cubit.state.isConnected) {
      final LyricPart part = lyricParts[page];
      cubit.updateText(part.text);
      cubit.updateStatus('${part.title} (${part.current} / ${part.total})');
      cubit.writeText();
      cubit.writeStatus();
    }
  };
}

void updateCommand(BleConnectionCubit cubit, String command) {
  if (cubit.state.isConnected) {
    cubit.updateCommand(command);
    cubit.writeCommand();
  }
}

class _PlayPageState extends State<PlayPage> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    final PageController controller = PageController();

    final PreviousIntent previousIntent = PreviousIntent();
    final NextIntent nextIntent = NextIntent();
    final HomeIntent homeIntent = HomeIntent();
    final EndIntent endIntent = EndIntent();
    final CloseIntent closeIntent = CloseIntent();

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
          HomeIntent: HomeAction(controller),
          EndIntent: EndAction(controller, widget.lyricParts.length),
          CloseIntent: CloseAction(context),
        },
        child: Focus(
          autofocus: true,
          child: BlocBuilder<BleConnectionCubit, BleConnectionState>(
            builder: (BuildContext context, BleConnectionState state) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(widget.title),
                  actions: <Widget>[
                    if (state.isConnected)
                      PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuItem<String>>[
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
                        ],
                        onSelected: (String command) {
                          final BleConnectionCubit bleConnectionCubit =
                              context.read<BleConnectionCubit>();
                          if (command == 'o') {
                            confirm(
                              context,
                              title: l10n.poweroff,
                              content: l10n.confirmPoweroff,
                              textOK: l10n.okButtonLabel,
                              textCancel: l10n.cancelButtonLabel,
                            ).then((result) => {
                                  if (result)
                                    {updateCommand(bleConnectionCubit, command)}
                                });
                          } else {
                            updateCommand(bleConnectionCubit, command);
                          }
                        },
                        icon: const Icon(Icons.settings_display),
                      ),
                  ],
                ),
                body: PageView(
                    controller: controller,
                    onPageChanged: (int page) {
                      if (state.isConnected) {
                        updatePage(context, widget.lyricParts)(page);
                      }
                      setState(
                        () {
                          current = page;
                        },
                      );
                    },
                    children: widget.lyricParts
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
                        .toList()),
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
