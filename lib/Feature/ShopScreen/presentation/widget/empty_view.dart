import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image or Illustration
        Image.asset(
          "assets/gift.png", // <-- put your empty state image
          height: 200,
        ),
        const SizedBox(height: 20),
        // Title
        const Text(
          "We’ll be back with exciting gifts!",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        const SizedBox(height: 8),

        // Subtitle
        const Text(
          "Stay tuned for upcoming rewards 🎁",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),

      ],
    );
  }
}
