import 'package:flutter/material.dart';
import '../../models/place.dart';
import 'booking_screen.dart';
import '../auth/login_screen.dart'; // صفحة تسجيل الدخول (Dummy)

// حالة تسجيل الدخول (Dummy)
bool isLoggedIn = false; // غيّرها إلى true لتجربة حالة المستخدم المسجل

class PlaceDetailsScreen extends StatelessWidget {
  final Place place;

  const PlaceDetailsScreen({super.key, required this.place});

  void _handleBooking(BuildContext context) {
    if (isLoggedIn) {
      // المستخدم مسجل الدخول
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BookingScreen(place: place)),
      );
    } else {
      // غير مسجل الدخول، نوجهه إلى صفحة تسجيل الدخول
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (_) => LoginScreen(
                onLoginSuccess: () {
                  isLoggedIn = true;
                  Navigator.pop(context); // غلق صفحة تسجيل الدخول
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(place: place),
                    ),
                  );
                },
                skipValidation: true, // ✅ تجاوز التحقق للفورم في الحالة هذه
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.05, 1.0],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFD4AF37), Colors.black],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        place.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black54,
                              offset: Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    place.image,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${place.tables} Tables available',
                  style: const TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  place.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () => _handleBooking(context),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
