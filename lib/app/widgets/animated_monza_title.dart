import 'package:flutter/material.dart';

class AnimatedMonzaTitle extends StatefulWidget {
  const AnimatedMonzaTitle({Key? key}) : super(key: key);
  @override
  State<AnimatedMonzaTitle> createState() => _AnimatedMonzaTitleState();
}

class _AnimatedMonzaTitleState extends State<AnimatedMonzaTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _scaleAnim = Tween<double>(
      begin: 1,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnim,
      child: const Text(
        'MONZA 2026',
        style: TextStyle(
          fontSize: 44,
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          letterSpacing: 4,
          shadows: [
            Shadow(blurRadius: 16, color: Colors.red, offset: Offset(0, 0)),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
