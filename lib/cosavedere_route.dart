import 'package:flutter/material.dart';

class CosaVedereRoute extends StatefulWidget {
  static var routeName = 'cosavedere';

  @override
  State<StatefulWidget> createState() {
    return _CosaVedereRouteState();
  }
}

class _CosaVedereRouteState extends State<CosaVedereRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CosaVedere'),
      ),
    );
  }
}
