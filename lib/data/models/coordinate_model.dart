import 'package:hweek/domain/domain.dart';

class CoordinateModel extends Coordinate {
  CoordinateModel({required super.latitude, required super.longitude});

  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      latitude: json['lat'] as double,
      longitude: json['lng'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
        'lat': latitude,
        'lng': longitude,
      };
}
