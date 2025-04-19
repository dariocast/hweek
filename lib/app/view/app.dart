import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hweek/app/view/home_page.dart';
import 'package:hweek/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF345C5C), // more muted, solemn teal
          primary: const Color(0xFF345C5C), // strong visual identity
          secondary: const Color(0xFFE6B76C), // softer gold for accents
          error: const Color(0xFFB3261E),
          surface: const Color(0xFFF9F6F2), // warm parchment-like background
          onPrimary: Colors.white,
          onSecondary: Colors.black87,
          onError: Colors.white,
          onSurface: Colors.black87,
        ),
        textTheme:
            GoogleFonts.ebGaramondTextTheme(), // Elegant + highly readable
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF345C5C),
          foregroundColor: Colors.white,
          titleTextStyle: GoogleFonts.ebGaramond(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFE6B76C),
          foregroundColor: Colors.black,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
