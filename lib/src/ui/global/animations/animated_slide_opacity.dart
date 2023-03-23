import 'package:flutter/material.dart';

class AnimatedSlideOpacity extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool endToStart;

  const AnimatedSlideOpacity({
    Key? key,
    required this.child,
    this.endToStart = false,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _AnimatedSlideOpacityState createState() => _AnimatedSlideOpacityState();
}

class _AnimatedSlideOpacityState extends State<AnimatedSlideOpacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 700));

      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _animation.value,
          child: Transform(
            transform: Matrix4.translationValues(
              (widget.endToStart ? 1.0 - _animation.value : _animation.value) *
                  36.0,
              0.0,
              1.0,
            ),
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
