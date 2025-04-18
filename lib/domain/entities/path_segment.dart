import 'package:hweek/domain/entities/entities.dart';

class PathSegment {
  const PathSegment({
    required this.head,
    required this.tail,
  });
  final Coordinate head;
  final Coordinate tail;
}
