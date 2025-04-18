class Coordinate {
  const Coordinate({
    required this.latitude,
    required this.longitude,
  });

  final double latitude;
  final double longitude;

  @override
  String toString() {
    return 'Coordinate(latitude: $latitude, longitude: $longitude)';
  }
}
