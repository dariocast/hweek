import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hweek/data/models/models.dart';

abstract class RemotePathDataSource {
  Future<List<PathSegmentModel>> getPathSegments();
}

class RemotePathDataSourceImpl implements RemotePathDataSource {
  RemotePathDataSourceImpl(this.client);
  final http.Client client;

  @override
  Future<List<PathSegmentModel>> getPathSegments() async {
    final response = await client.get(
      Uri.parse('https://marmot-civil-gratefully.ngrok-free.app/api/paths'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch path segments');
    }

    final decoded = json.decode(response.body) as List<dynamic>;
    return decoded
        .map((e) => PathSegmentModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
