import 'package:flutter/material.dart';

class MeteoRoute extends StatefulWidget {
  static var routeName = 'meteo';

  @override
  State<StatefulWidget> createState() {
    return _MeteoRouteState();
  }
}

class _MeteoRouteState extends State<MeteoRoute> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsioni Meteo'),
        centerTitle: true ,
      ),
      body: Center(
        child: Text("Ciao"),
      ),
    );
  }

}