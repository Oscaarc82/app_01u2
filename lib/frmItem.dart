import 'package:flutter/material.dart';

class FrameworkItem extends StatelessWidget {
  final String title;
  final String imageAsset;

  const FrameworkItem({
    required this.title,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageAsset,
            width: 100, // Ancho de la imagen
            height: 100, // Alto de la imagen
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
