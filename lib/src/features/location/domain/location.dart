// ignore_for_file: public_member_api_docs, sort_constructors_first
class Location {
  final double latitude;
  final double longitude;

  Location({required this.latitude, required this.longitude});

  @override
  String toString() => 'Location(latitude: $latitude, longitude: $longitude)';
}
