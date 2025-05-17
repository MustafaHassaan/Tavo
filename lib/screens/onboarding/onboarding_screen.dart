import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../models/onboarding_slide.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingSlide> slides = [
    OnboardingSlide(
      title: "Find your table for any occasion",
      subtitle: "An unrivaled selection of restaurants for whatever you want",
      image1: "assets/images/Right.png",
      image2: "assets/images/Left.jpg",
    ),
    OnboardingSlide(
      title: "Book easily in seconds",
      subtitle: "Quick and simple way to reserve your favorite spot",
      image1: "assets/images/Right.png",
      image2: "assets/images/Left.jpg",
    ),
    OnboardingSlide(
      title: "Enjoy your meal",
      subtitle: "Experience the best dining with ease and comfort",
      image1: "assets/images/Right.png",
      image2: "assets/images/Left.jpg",
    ),
  ];

  void _nextPage() {
    if (_currentPage < slides.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToHome();
      print("Done");
    }
  }

  void _goToHome() {
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.05, 1.0], // الأسود يبدأ من 30% لفوق
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFFD4AF37), // أصفر ذهبي غني
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: slides.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder:
                      (context, index) => OnboardingPage(slide: slides[index]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // زر الرجوع (لو مش أول صفحة يظهر)
                    if (_currentPage > 0)
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: _previousPage,
                      )
                    else
                      SizedBox(width: 48), // عشان يوازن الفراغ
                    // زر تخطي
                    TextButton(
                      onPressed: _goToHome,
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    // مؤشر الصفحات
                    SmoothPageIndicator(
                      controller: _controller,
                      count: slides.length,
                      effect: const WormEffect(
                        dotColor: Colors.white54,
                        activeDotColor: Colors.white,
                      ),
                    ),

                    // زر التالي / السهم الأمامي
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      onPressed: _nextPage,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
