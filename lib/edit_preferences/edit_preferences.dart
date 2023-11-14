import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:preferences_bloc/preferences_bloc.dart';

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

class SaveIntent extends Intent {}

class SaveAction extends Action<SaveIntent> {
  SaveAction(this.context);
  final BuildContext context;

  @override
  Object? invoke(SaveIntent intent) {
    final LiplPreferences item =
        context.read<LiplEditPreferencesBloc>().state.preferences;
    context.read<LiplPreferencesBloc>().add(
          PreferencesEventChange<LiplPreferences>(
            item: item,
          ),
        );
    Navigator.of(context).pop();
    return null;
  }
}

class EditPreferencesPage extends StatelessWidget {
  const EditPreferencesPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (BuildContext context) => const EditPreferencesPage(),
    );
  }

  @override
  Widget build(BuildContext context) => const EditPreferencesView();
}

class EditPreferencesView extends StatelessWidget {
  const EditPreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return Shortcuts(
      shortcuts: <SingleActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.keyS, control: true):
            SaveIntent(),
        const SingleActivator(LogicalKeyboardKey.escape): CloseIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          SaveIntent: SaveAction(context),
          CloseIntent: CloseAction(context),
        },
        child: Builder(builder: (BuildContext context) {
          return Focus(
            autofocus: true,
            child: BlocBuilder<LiplEditPreferencesBloc,
                EditPreferencesState<LiplPreferences>>(
              builder: (
                BuildContext context,
                EditPreferencesState<LiplPreferences> state,
              ) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text(l10n.preferences),
                  ),
                  body: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView(
                        children: <Widget>[
                          TextFormField(
                            initialValue:
                                state.preferences.credentials?.username ?? '',
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            decoration:
                                InputDecoration(labelText: l10n.usernameLabel),
                            onChanged: (String value) {
                              context.read<LiplEditPreferencesBloc>().add(
                                    EditPreferencesEventChange<LiplPreferences>(
                                      preferences: state.preferences.copyWith(
                                        credentials: () => Credentials(
                                            username: state.preferences
                                                    .credentials?.username ??
                                                '',
                                            password: value),
                                      ),
                                    ),
                                  );
                            },
                          ),
                          TextFormField(
                            initialValue:
                                state.preferences.credentials?.password ?? '',
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: l10n.passwordLabel,
                            ),
                            onChanged: (String value) {
                              context.read<LiplEditPreferencesBloc>().add(
                                    EditPreferencesEventChange<LiplPreferences>(
                                        preferences: state.preferences.copyWith(
                                      credentials: () => Credentials(
                                          username: state.preferences
                                                  .credentials?.username ??
                                              '',
                                          password: value),
                                    )),
                                  );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: state.hasChanged
                        ? Actions.handler(context, SaveIntent())
                        : null,
                    child: const Icon(Icons.save),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
