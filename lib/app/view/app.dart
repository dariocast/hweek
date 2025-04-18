import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hweek/features/view_paths/view_paths_page.dart';
import 'package:hweek/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF369694), // Primary brand color
          primary: const Color(0xFF369694), // Main app color
          secondary: const Color(0xFFFFBD59), // Accent color
          error: const Color(0xFFC42722), // Error color
          surface: Colors.white,
          onPrimary: Colors.white, // Text on primary color
          onSecondary: Colors.black, // Text on secondary color
          onError: Colors.white,
          onSurface: Colors.black,
        ),
        textTheme: GoogleFonts.uncialAntiquaTextTheme(), // Apply medieval font
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF369694),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.uncialAntiqua(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFFFFBD59), // Button color
          textTheme: ButtonTextTheme.primary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ViewPathsPage(),
    );
  }
}
