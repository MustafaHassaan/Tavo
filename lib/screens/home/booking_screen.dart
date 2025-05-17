import 'package:flutter/material.dart';
import '../../models/Booking.dart';
import '../../models/place.dart';
import '../../services/booking_service.dart';

class BookingScreen extends StatefulWidget {
  final Place place;
  const BookingScreen({super.key, required this.place});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final List<Booking> bookings = [];
  DateTime? selectedStartTime;
  int guestCount = 1;

  void _pickStartTime() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFFD4AF37)),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate == null) return;

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFFD4AF37)),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime == null) return;

    final startDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      selectedStartTime = startDateTime;
    });
  }

  void _tryBooking() {
    if (selectedStartTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date & time.')),
      );
      return;
    }

    final booking = bookPlace(
      bookings: bookings,
      place: widget.place,
      start: selectedStartTime!,
      userId: 'dummyUser123',
    );

    if (booking != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking confirmed! ID: ${booking.id}')),
      );
      setState(() {});
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Time slot unavailable.')));
    }
  }

  String formatDateTime(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4AF37),
        title: Text('Book a Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔶 كارد بيانات المستخدم (Dummy)
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/user_dummy.jpg'),
                ),
                title: const Text('Elsie Johnson'),
                subtitle: const Text('+01 478-244-8725'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ),
            // 🔶 كارد بيانات المكان المحجوز
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: ListTile(
                leading: const Icon(Icons.place, color: Colors.black),
                title: Text(widget.place.title),
                subtitle: const Text(
                  '123 Street Name, City',
                ), // العنوان هنا ممكن يتغير لاحقًا حسب البيانات
              ),
            ),
            const SizedBox(height: 20),
            // 🔶 التاريخ والوقت
            Text(
              'Date & Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: _pickStartTime,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  selectedStartTime == null
                      ? 'Select Date & Time'
                      : formatDateTime(selectedStartTime!),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔶 عدد الضيوف
            Text(
              'Guest',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (guestCount > 1) guestCount--;
                      });
                    },
                  ),
                  Text('$guestCount Guest${guestCount > 1 ? 's' : ''}'),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        guestCount++;
                      });
                    },
                  ),
                ],
              ),
            ),

            const Spacer(),

            // 🔶 زرارين Cancel و Confirm
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Color(0xFFD4AF37)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _tryBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
