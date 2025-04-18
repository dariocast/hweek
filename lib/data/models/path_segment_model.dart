import 'package:hweek/data/models/models.dart';
import 'package:hweek/domain/domain.dart';

class PathSegmentModel extends PathSegment {
  PathSegmentModel({required super.head, required super.tail});

  factory PathSegmentModel.fromJson(Map<String, dynamic> json) {
    return PathSegmentModel(
      head: CoordinateModel.fromJson(json['head'] as Map<String, dynamic>),
      tail: CoordinateModel.fromJson(json['tail'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'head': (head as CoordinateModel).toJson(),
        'tail': (tail as CoordinateModel).toJson(),
      };
}
