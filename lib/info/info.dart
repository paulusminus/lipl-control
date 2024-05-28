import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lipl_control/l10n/l10n.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      fullscreenDialog: true,
      builder: (BuildContext context) => const InfoPage(),
    );
  }

  @override
  Widget build(BuildContext context) => const InfoView();
}

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final packageInfo = RepositoryProvider.of<PackageInfo>(context);
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Info"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(l10n.name),
              subtitle: Text(packageInfo.appName),
            ),
            ListTile(
              title: Text(l10n.version),
              subtitle: Text(packageInfo.version),
            ),
            ListTile(
              title: Text(l10n.description),
              subtitle: Text(l10n.appDescription),
            ),
            ListTile(
              title: Text(l10n.repository),
              subtitle: Text(l10n.appRepository),
            ),
          ],
        ),
      ),
    );
  }
}
