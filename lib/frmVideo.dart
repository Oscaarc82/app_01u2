import 'package:flutter/material.dart';

class VideoItem extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailAsset;
  final String videoUrl;

  const VideoItem({
    required this.title,
    required this.description,
    required this.thumbnailAsset,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implementa la lógica para reproducir el video
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              thumbnailAsset,
              width: double.infinity,
              height: 250, // Establece el alto deseado aquí
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}