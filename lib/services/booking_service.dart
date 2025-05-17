import '../models/Booking.dart';
import '../models/place.dart';
import 'package:uuid/uuid.dart';

const Duration defaultBookingDuration = Duration(hours: 2);
final uuid = Uuid();

bool isTimeSlotAvailable(
  List<Booking> bookings,
  Place place,
  DateTime start,
  DateTime end,
) {
  for (var booking in bookings) {
    if (booking.place.title == place.title) {
      if (start.isBefore(booking.endTime) && end.isAfter(booking.startTime)) {
        return false;
      }
    }
  }
  return true;
}

Booking? bookPlace({
  required List<Booking> bookings,
  required Place place,
  required DateTime start,
  required String userId,
  Duration duration = defaultBookingDuration,
}) {
  final end = start.add(duration);

  if (isTimeSlotAvailable(bookings, place, start, end)) {
    final id = uuid.v4(); // معرف فريد جديد لكل حجز

    final booking = Booking(
      id: id,
      place: place,
      startTime: start,
      endTime: end,
      userId: userId,
    );

    bookings.add(booking);
    return booking; // ترجع الحجز اللي تم
  } else {
    return null; // الوقت غير متاح
  }
}
