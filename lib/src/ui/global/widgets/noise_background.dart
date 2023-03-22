import 'dart:math' as math;

import 'package:flutter/material.dart';

class NoiseBackground extends StatelessWidget {
  const NoiseBackground({
    Key? key,
    required this.color,
    required this.intensity,
    this.child,
  }) : super(key: key);

  final Color color;
  final double intensity;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _NoisePainter(color: color, intensity: intensity),
      child: child,
    );
  }
}

class _NoisePainter extends CustomPainter {
  _NoisePainter({
    required this.color,
    required this.intensity,
  }) : super();

  final Color color;
  final double intensity;
  final math.Random random = math.Random();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    for (var x = 0; x < size.width; x++) {
      for (var y = 0; y < size.height; y++) {
        if (random.nextDouble() < intensity) {
          final rect = Rect.fromLTWH(x.toDouble(), y.toDouble(), 1.2, 1.2);
          final shade = color.withAlpha(random.nextInt(256));
          paint.color = shade;
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(_NoisePainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.intensity != intensity;
  }
}
