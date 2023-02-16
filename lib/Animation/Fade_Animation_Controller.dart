import 'package:flutter/material.dart';

class MyFadeIn extends StatefulWidget {
  final Widget child;
  final int delaymseconds;

  MyFadeIn({Key? key, required this.child, required this.delaymseconds})
      : super(key: key);

  @override
  State<MyFadeIn> createState() => _MyFadeInState();
}

class _MyFadeInState extends State<MyFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.delaymseconds));

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation as Animation<double>,
      child: widget.child,
    );
  }
}
