import 'package:flutter/material.dart';
import '../../../../models/onboarding_slide.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingSlide slide;

  const OnboardingPage({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        // الصورة اليسرى
        Positioned(
          top: height * 0.15,
          left: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              slide.image1,
              width: 200,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // الصورة اليمنى
        Positioned(
          top: height * 0.25,
          right: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              slide.image2,
              width: 180,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
        ),

        // النصوص
        Positioned(
          top: height * 0.45,
          left: 24,
          right: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                slide.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                slide.subtitle,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
