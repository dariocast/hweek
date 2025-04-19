import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hweek/features/features.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final sections = [
      _HomeSection(
        title: localizations.home_mapOfProcessions,
        builder: () => const ViewPathsPage(),
      ),
      _HomeSection(
        title: localizations.home_schedules,
        builder: () => Scaffold(
          appBar: AppBar(
            title: Text(localizations.home_schedules),
          ),
          body: const Center(child: Text('Coming Soon')),
        ),
      ),
      _HomeSection(
        title: localizations.home_confraternities,
        builder: () => Scaffold(
            appBar: AppBar(
              title: Text(localizations.home_confraternities),
            ),
            body: const Center(child: Text('Confraternities - Coming Soon'))),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.home_appTitle),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final section = sections[index];
          return ListTile(
            title: Text(section.title),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => section.builder()),
              );
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}

class _HomeSection {
  const _HomeSection({required this.title, required this.builder});
  final String title;
  final Widget Function() builder;
}
