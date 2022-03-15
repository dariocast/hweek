import 'package:flutter/material.dart';
import 'package:settimana_santa/home_route.dart';
import 'package:settimana_santa/miserere_route.dart';
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
      //routing info
      initialRoute: HomeRoute.routeName,
      routes: {
        ConfraterniteRoute.routeName: (context) => ConfraterniteRoute(),
        ProgrammaRoute.routeName: (context) => ProgrammaRoute(),
        CosaVedereRoute.routeName: (context) => CosaVedereRoute(),
        FotogalleryRoute.routeName: (context) => FotogalleryRoute(),
        MeteoRoute.routeName: (context) => MeteoRoute(),
        MiserereRoute.routeName: (context) => MiserereRoute(),
      },
      title: 'Passo dopo passo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Morris',
        canvasColor: Colors.amber[50],
        textTheme: TextTheme(
          subtitle1: TextStyle(
            fontFamily: 'Morris',
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
          bodyText2: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
          headline6: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          subtitle2: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          button: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          caption: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: HomeRoute(title: 'Settimana Santa 2020'),
    );
  }
}
