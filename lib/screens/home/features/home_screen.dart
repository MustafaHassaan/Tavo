import 'package:flutter/material.dart';
import '../../../models/place.dart';
import '../../widgets/place_card.dart';
import '../place_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Place> places = [
    Place(
      title: "Garden Area",
      tables: 6,
      image: "assets/images/Indoor.jpg",
      description:
          "Escape to the serene Garden Area, where lush greenery and calming ambiance create the perfect setting for unforgettable gatherings. Enjoy your meal surrounded by nature’s beauty.",
    ),
    Place(
      title: "VIP Lounge",
      tables: 4,
      image: "assets/images/VIP.jpg",
      description:
          "Escape to the serene Garden Area, where lush greenery and calming ambiance create the perfect setting for unforgettable gatherings. Enjoy your meal surrounded by nature’s beauty.",
    ),
    Place(
      title: "Terrace",
      tables: 8,
      image: "assets/images/Roof.jpg",
      description:
          "Escape to the serene Garden Area, where lush greenery and calming ambiance create the perfect setting for unforgettable gatherings. Enjoy your meal surrounded by nature’s beauty.",
    ),
    Place(
      title: "Balcony",
      tables: 5,
      image: "assets/images/Balcony.jpg",
      description:
          "Escape to the serene Garden Area, where lush greenery and calming ambiance create the perfect setting for unforgettable gatherings. Enjoy your meal surrounded by nature’s beauty.",
    ),
    Place(
      title: "Main Hall",
      tables: 3,
      image: "assets/images/MainHall.jpg",
      description:
          "Escape to the serene Garden Area, where lush greenery and calming ambiance create the perfect setting for unforgettable gatherings. Enjoy your meal surrounded by nature’s beauty.",
    ),
    Place(
      title: "Garden Patio",
      tables: 3,
      image: "assets/images/GardenPatio.jpg",
      description:
          "Escape to the serene Garden Area, where lush greenery and calming ambiance create the perfect setting for unforgettable gatherings. Enjoy your meal surrounded by nature’s beauty.",
    ),
  ];

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Choose a place",
                  style: TextStyle(
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
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return PlaceCard(
                        place: places[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      PlaceDetailsScreen(place: places[index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
