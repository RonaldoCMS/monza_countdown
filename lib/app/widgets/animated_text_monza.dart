import 'package:flutter/material.dart';

class AnimatedTextMonza extends StatefulWidget {
  const AnimatedTextMonza({Key? key}) : super(key: key);
  @override
  State<AnimatedTextMonza> createState() => _AnimatedTextMonzaState();
}

class _AnimatedTextMonzaState extends State<AnimatedTextMonza>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _colorAnim = ColorTween(
      begin: Colors.yellow,
      end: Colors.white,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnim,
      builder: (context, child) {
        return Text(
          'Countdown al Gran Premio di Monza',
          style: TextStyle(
            fontSize: 24,
            color: _colorAnim.value,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 8,
                color: Colors.redAccent,
                offset: Offset(0, 0),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        );
      },
    );
  }
}
