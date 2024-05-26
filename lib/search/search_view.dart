import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_app_bloc/lipl_app_bloc.dart';
import 'package:lipl_control/app/app.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:lipl_control/search/search_cubit.dart';
import 'package:lipl_control/widget/widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static MaterialPageRoute<void> route() => MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => const SearchPage(),
      );

  @override
  Widget build(BuildContext context) {
    return SearchForm2(formKey: GlobalKey());
  }
}

class SearchForm2 extends StatelessWidget {
  const SearchForm2({required this.formKey, super.key});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final String searchTerm =
        context.select<SearchCubit, String>((cubit) => cubit.state.searchTerm);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.searchPageTitle)),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    child: TextFormField(
                      autofocus: true,
                      initialValue: '',
                      onChanged: (String value) {
                        context.read<SearchCubit>().searchChanged(value);
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text(l10n.searchTitleContains),
                      ),
                      validator: (String? value) {
                        if (value == null || value.trim().length < 3) {
                          return l10n.searchMinimalCharsError;
                        }
                        return null;
                      },
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: textButton<void>(
                      item: null,
                      buttonData: ButtonData<void>(
                        label: l10n.searchButtonLabel,
                        enabled: (_) => searchTerm.length >= 3,
                        onPressed: (_) {
                          final FormState? form = formKey.currentState;
                          if (form?.validate() ?? false) {
                            context.read<SearchCubit>().searchChanged(
                                  searchTerm,
                                );
                            form?.reset();
                            context.read<SearchCubit>().searchChanged('');
                            final FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            // searchFocus.requestFocus();
                          }
                        },
                        showOnMobile: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SearchResults(searchTerm: searchTerm),
          ),
        ],
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  const SearchResults({required this.searchTerm, super.key});
  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = context.l10n;

    return BlocBuilder<SearchCubit, SearchState>(
      builder: (BuildContext context, SearchState state) {
        final lyrics = context.read<LiplAppCubit>().searchResults(searchTerm);
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              '${lyrics.isNotEmpty ? l10n.searchDoesHaveResults : l10n.searchNoResults} ${l10n.searchResultsFor} ${state.searchTerm}',
            ),
          ),
          subtitle: renderLyricList(Stream.fromIterable([lyrics])),
        );
      },
    );
  }
}
