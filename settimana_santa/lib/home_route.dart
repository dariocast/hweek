import 'package:flutter/material.dart';

class HomeRoute extends StatefulWidget {
  static var routeName = '/';

  HomeRoute({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          leading: Image(image: AssetImage('assets/icons/icon.png')),
          centerTitle: true,
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.yellow,),
              onPressed: () {

              },
            ),
          ]
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Confraternite'),
            subtitle: Text('Informazioni, foto e curiosità'),
          ),
          Divider(),
          ListTile(
            title: Text('Programma',),
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
          ),
          Divider(),
          ListTile(
            title: Text('Il Meteo'),
            subtitle: Text('Previsioni meteorologiche'),
          )
        ],
      ),
    );
  }
}
