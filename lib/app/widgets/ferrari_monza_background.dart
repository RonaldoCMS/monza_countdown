import 'package:flutter/material.dart';

class FerrariMonzaBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.18,
            child: Image.asset('assets/background.jpg', fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
