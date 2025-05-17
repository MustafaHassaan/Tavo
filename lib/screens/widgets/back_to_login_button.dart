// widget/back_to_login_button.dart
import 'package:flutter/material.dart';

class BackToLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double topPadding;

  const BackToLoginButton({
    super.key,
    required this.onPressed,
    this.topPadding = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: const Text(
          'Back to Login',
          style: TextStyle(
            color: Color(0xFFD4AF37),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
