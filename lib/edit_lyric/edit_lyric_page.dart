import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_model/lipl_model.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:loading_status/loading_status.dart';
import 'edit_lyric_cubit.dart';

class CloseIntent extends Intent {}

class CloseAction extends Action<CloseIntent> {
  CloseAction(this.context);
  final BuildContext context;
  @override
  Object? invoke(CloseIntent intent) {
    context.read<EditLyricCubit>().submitted();
    return null;
  }
}

class SaveIntent extends Intent {}

class SaveAction extends Action<SaveIntent> {
  SaveAction(this.editLyricCubit, this.liplRestCubit, this.isNew);
  final EditLyricCubit editLyricCubit;
  final LiplAppCubit liplRestCubit;
  final bool isNew;

  @override
  Object? invoke(SaveIntent intent) async {
    final EditLyricState state = editLyricCubit.state;
    if (isNew) {
      await liplRestCubit.postLyric(
        Lyric(
          id: null,
          title: state.title,
          parts: state.text.toParts(),
        ),
      );
    } else {
      await liplRestCubit.putLyric(
        Lyric(
          id: state.id!,
          title: state.title,
          parts: state.text.toParts(),
        ),
      );
    }
    editLyricCubit.submitted();
    return null;
  }
}

class EditLyricPage extends StatelessWidget {
  const EditLyricPage({super.key});

  static Route<void> route(
      {String? id, String? title, List<List<String>>? parts}) {
    return MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (BuildContext context) => BlocProvider<EditLyricCubit>(
        create: (BuildContext context) => EditLyricCubit(
          id: id,
          title: title,
          parts: parts,
        ),
        child: const EditLyricPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditLyricCubit, EditLyricState>(
      listenWhen: (EditLyricState previous, EditLyricState current) =>
          previous.status != current.status &&
          current.status == LoadingStatus.success,
      listener: (BuildContext context, EditLyricState state) =>
          Navigator.of(context).pop(),
      child: const EditLyricView(),
    );
  }
}

class EditLyricView extends StatelessWidget {
  const EditLyricView({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    final LoadingStatus status =
        context.select((EditLyricCubit cubit) => cubit.state.status);
    final bool isNew =
        context.select((EditLyricCubit cubit) => cubit.state.id == null);
    final EditLyricCubit editLyricCubit = context.read<EditLyricCubit>();
    final LiplAppCubit liplRestCubit = context.read<LiplAppCubit>();

    return Shortcuts(
      shortcuts: <SingleActivator, Intent>{
        const SingleActivator(LogicalKeyboardKey.keyS, control: true):
            SaveIntent(),
        const SingleActivator(LogicalKeyboardKey.escape): CloseIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          SaveIntent: SaveAction(editLyricCubit, liplRestCubit, isNew),
          CloseIntent: CloseAction(context),
        },
        child: Builder(
          builder: (BuildContext context) => Focus(
            autofocus: true,
            child: Scaffold(
              appBar: AppBar(
                title: Text(isNew ? l10n.newLyric : l10n.editLyric),
              ),
              body: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      _TitleField(),
                      _TextField(),
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: status.isLoadingOrSuccess
                    ? null
                    : Actions.handler(context, SaveIntent()),
                child: status.isLoadingOrSuccess
                    ? const CupertinoActivityIndicator()
                    : const Icon(Icons.save),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleField extends StatelessWidget {
  const _TitleField();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return BlocBuilder<EditLyricCubit, EditLyricState>(
      builder: (BuildContext context, EditLyricState state) {
        return TextFormField(
          key: const Key('editLyricView_title_textFormField'),
          initialValue: state.title,
          decoration: InputDecoration(
            enabled: !state.status.isLoadingOrSuccess,
            labelText: l10n.titleLabel,
            hintText: state.title,
          ),
          maxLength: 50,
          inputFormatters: <TextInputFormatter>[
            LengthLimitingTextInputFormatter(50),
          ],
          onChanged: (String value) {
            context.read<EditLyricCubit>().titleChanged(value);
          },
        );
      },
    );
  }
}

class _TextField extends StatelessWidget {
  const _TextField();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;
    return BlocBuilder<EditLyricCubit, EditLyricState>(
      builder: (BuildContext context, EditLyricState state) {
        return TextFormField(
          key: const Key('editLyricView_text_textFormField'),
          maxLines: null,
          initialValue: state.text,
          decoration: InputDecoration(
            enabled: !state.status.isLoadingOrSuccess,
            labelText: l10n.textLabel,
            hintText: state.text,
          ),
          onChanged: (String value) {
            context.read<EditLyricCubit>().textChanged(value);
          },
        );
      },
    );
  }
}
