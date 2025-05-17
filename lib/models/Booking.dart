import 'package:tavo/models/place.dart';

class Booking {
  final String id;
  final Place place;
  final String userId;
  final DateTime startTime;
  final DateTime endTime;
  final String status; // مثلا 'confirmed', 'cancelled', 'pending'

  Booking({
    required this.id,
    required this.place,
    required this.userId,
    required this.startTime,
    required this.endTime,
    this.status = 'confirmed',
  });
}
