import 'package:flutter/material.dart';

class ProgrammaRoute extends StatefulWidget {
  static var routeName = 'programma';

  @override
  State<StatefulWidget> createState() {
    return _ProgrammaRouteState();
  }
}

class _ProgrammaRouteState extends State<ProgrammaRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programma'),
      ),
    );
  }
}
