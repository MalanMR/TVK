import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const EventCard({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to make responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final imageHeight = screenWidth * 0.3; // 30% of screen width

    return IntrinsicHeight(
      child: Card(
        elevation: 3,
        color: const Color(0xFFf2f2f2),
        shadowColor: Colors.brown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Responsive image height
            Expanded(
              child:
              CachedNetworkImage(
                imageUrl: imagePath,
                placeholder: (context, url) => Container(color: Colors.grey[100]),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fadeInDuration: const Duration(milliseconds: 100),
              ),
            ),
            const SizedBox(height: 2),
            // Title section
            Padding(
              padding: (title=='Food & Accommodation')?const EdgeInsets.only(bottom: 0):const EdgeInsets.only(bottom: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0XFF2c1507),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}