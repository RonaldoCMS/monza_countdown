import 'package:flutter/material.dart';

class AnimatedCountdownNumber extends StatelessWidget {
  final String label;
  final int value;
  final Color color;
  const AnimatedCountdownNumber({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: Text(
              '$value',
              key: ValueKey(value),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: color,
                shadows: [
                  Shadow(
                    blurRadius: 16,
                    color: Colors.redAccent,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
