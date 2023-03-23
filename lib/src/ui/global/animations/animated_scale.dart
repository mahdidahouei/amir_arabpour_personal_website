import 'package:flutter/material.dart';

class MyAnimatedScale extends StatefulWidget {
  final Widget child;

  MyAnimatedScale({required this.child});

  @override
  _MyAnimatedScaleState createState() => _MyAnimatedScaleState();
}

class _MyAnimatedScaleState extends State<MyAnimatedScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onMouseEnter(PointerEvent details) {
    _controller.forward();
  }

  void _onMouseExit(PointerEvent details) {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onMouseEnter,
      onExit: _onMouseExit,
      cursor: SystemMouseCursors.click,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
      ),
    );
  }
}
