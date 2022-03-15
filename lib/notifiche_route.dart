import 'package:flutter/material.dart';

class NotificheRoute extends StatefulWidget {
  static var routeName = 'notifiche';

  @override
  State<StatefulWidget> createState() {
    return _NotificheRouteState();
  }
}

class _NotificheRouteState extends State<NotificheRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifiche'),
      ),
    );
  }
}
