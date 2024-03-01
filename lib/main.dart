import 'package:flutter/material.dart';
import 'package:settimana_santa/home_route.dart';
import 'package:settimana_santa/miserere_route.dart';
import 'package:settimana_santa/notifiche_route.dart';
import 'package:settimana_santa/programma_route.dart';

import 'confraternite_route.dart';
import 'cosavedere_route.dart';
import 'fotogallery_route.dart';
import 'meteo_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //routing info
      initialRoute: HomeRoute.routeName,
      routes: {
        ConfraterniteRoute.routeName: (context) => ConfraterniteRoute(),
        ProgrammaRoute.routeName: (context) => ProgrammaRoute(),
        CosaVedereRoute.routeName: (context) => CosaVedereRoute(),
        FotogalleryRoute.routeName: (context) => FotogalleryRoute(),
        MeteoRoute.routeName: (context) => MeteoRoute(),
        MiserereRoute.routeName: (context) => MiserereRoute(),
        NotificheRoute.routeName: (context) => NotificheRoute(),
      },
      title: 'Passo dopo passo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.red[900],
        ),
        fontFamily: 'Morris',
        canvasColor: Colors.amber[50],
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontFamily: 'Morris',
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
          titleLarge: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          labelLarge: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: HomeRoute(title: 'Settimana Santa 2023'),
    );
  }
}
