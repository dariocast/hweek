import 'package:flutter/material.dart';
import 'package:settimana_santa/meteo_route.dart';
import 'package:settimana_santa/miserere_route.dart';
import 'package:settimana_santa/notifiche_route.dart';

import 'fotogallery_route.dart';

class HomeRoute extends StatefulWidget {
  static var routeName = '/';

  HomeRoute({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.red[900],
          title: Text(widget.title),
          leading: Image(image: AssetImage('assets/icons/icon.png')),
          centerTitle: true,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.yellow,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(NotificheRoute.routeName);
              },
            ),
          ]),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Confraternite'),
            subtitle: Text('Informazioni, foto e curiosità'),
          ),
          Divider(),
          ListTile(
            title: Text(
              'Programma',
            ),
            subtitle: Text('Itinerario ufficiale delle confraternite'),
          ),
          Divider(),
          ListTile(
            title: Text('Cosa vedere'),
            subtitle: Text('Ti suggeriamo cosa vedere in base a dove ti trovi'),
          ),
          Divider(),
          ListTile(
            title: Text('Fotogallery'),
            subtitle: Text('Le immagini della Settimana Santa'),
            onTap: () {
              Navigator.of(context).pushNamed(FotogalleryRoute.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text('Il Meteo'),
            subtitle: Text('Previsioni meteorologiche'),
            onTap: () {
              Navigator.of(context).pushNamed(MeteoRoute.routeName);
            },
          ),
          Divider(),
          ListTile(
            title: Text(
              'Il Miserere',
            ),
            subtitle: Text(
              'Coro maschile del Venerdì Santo',
            ),
            onTap: () {
              Navigator.of(context).pushNamed(MiserereRoute.routeName);
            },
          )
        ],
      ),
    );
  }
}
