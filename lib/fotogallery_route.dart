import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';

class FotogalleryRoute extends StatefulWidget {
  static var routeName = 'fotogallery';

  @override
  State<StatefulWidget> createState() {
    return _FotogalleryRouteState();
  }
}

class _FotogalleryRouteState extends State<FotogalleryRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Foto Gallery"),
        ),
        body: Center(
          child: FutureBuilder<List<String>>(
            future: fetchGalleryData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    itemCount: snapshot.data?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                              decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          snapshot.data![index]),
                                      fit: BoxFit.cover))));
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}

Future<List<String>> fetchGalleryData() async {
  try {
    final response = await http
        .get(Uri.parse(
            'http://dariocast.altervista.org/miserere/api/getImages.php'))
        .timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return compute(parseGalleryData, response.body);
    } else {
      throw Exception('Failed to load');
    }
  } on SocketException {
    throw Exception('Failed to load');
  }
}

List<String> parseGalleryData(String responseBody) {
  final parsed = List<String>.from(json.decode(responseBody));
  return parsed;
}
