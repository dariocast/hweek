import 'package:flutter/material.dart';

class ConfraterniteRoute extends StatefulWidget {
  static var routeName = 'confraternite';

  @override
  State<StatefulWidget> createState() {
    return _ConfraterniteRouteState();
  }
}

class _ConfraterniteRouteState extends State<ConfraterniteRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confraternite'),
      ),
    );
  }
}
