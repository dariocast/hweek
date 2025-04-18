import 'package:hweek/domain/entities/entities.dart';

abstract class PathRepository {
  Future<List<PathSegment>> fetchPathSegments();
}
