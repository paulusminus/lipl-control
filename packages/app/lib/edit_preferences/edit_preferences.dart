import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart' hide logger;
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_model/lipl_model.dart';

class EditPreferencesCubit extends Cubit<Credentials?> {
  EditPreferencesCubit() : super(null);

  void setCredentials(Credentials? credentials) {
    emit(credentials);
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

class SaveIntent extends Intent {}

class SaveAction extends Action<SaveIntent> {
  SaveAction(this.context);
  final BuildContext context;

  @override
  Object? invoke(SaveIntent intent) async {
    logger.info('Save button pressed');
    final liplAppCubit = context.read<LiplAppCubit>();
    final editPreferencesCubit = context.read<EditPreferencesCubit>();
    logger.info('Preferences fetched from LiplEditPreferencesBloc');
    final navigator = Navigator.of(context);
    liplAppCubit.preferencesChanged(editPreferencesCubit.state);
    logger.info('Preferences sent to LiplAppCubit');
    liplAppCubit.load();
    final appState = await liplAppCubit.stream
        .where((state) => state.status != LoadingStatus.loading)
        .single;
    if (appState.status == LoadingStatus.success) {
      navigator.pop();
      logger.info('Navigate to parent finished');
    }
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
    final Credentials? appCredentials =
        context.read<LiplAppCubit>().state.credentials;
    final editPreferencesCubit = context.read<EditPreferencesCubit>();
    editPreferencesCubit.setCredentials(appCredentials);
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
            child: BlocBuilder<EditPreferencesCubit, Credentials?>(
              builder: (
                BuildContext context,
                Credentials? credentials,
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
                            initialValue: credentials?.username ?? '',
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            decoration:
                                InputDecoration(labelText: l10n.usernameLabel),
                            onChanged: (String username) {
                              final editPreferencesCubit =
                                  context.read<EditPreferencesCubit>();
                              editPreferencesCubit.setCredentials(Credentials(
                                  username: username,
                                  password: credentials?.password));
                            },
                          ),
                          TextFormField(
                            initialValue: credentials?.password ?? '',
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: l10n.passwordLabel,
                            ),
                            onChanged: (String password) {
                              final editPreferencesCubit =
                                  context.read<EditPreferencesCubit>();
                              editPreferencesCubit.setCredentials(Credentials(
                                username: credentials?.username,
                                password: password,
                              ));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    onPressed: appCredentials != credentials
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
