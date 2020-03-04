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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.red[900],
        fontFamily: 'Morris',
        canvasColor: Colors.amber[50],
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
          subtitle: TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          button
              : TextStyle(
            color: Colors.red[900],
            fontFamily: 'Morris',
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
          caption
              :TextStyle(
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
