import 'package:flutter/material.dart';

class AnimatedCheckeredFlag extends StatefulWidget {
  const AnimatedCheckeredFlag({Key? key}) : super(key: key);
  @override
  State<AnimatedCheckeredFlag> createState() => _AnimatedCheckeredFlagState();
}

class _AnimatedCheckeredFlagState extends State<AnimatedCheckeredFlag>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _offsetAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _offsetAnim = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnim,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_offsetAnim.value, 0),
          child: Image.asset(
            'assets/checkered_flag.png',
            width: 64,
            height: 64,
          ),
        );
      },
    );
  }
}
