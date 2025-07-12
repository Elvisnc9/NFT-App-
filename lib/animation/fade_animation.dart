


import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeAnimation extends StatelessWidget {
  const FadeAnimation({super.key, 
  this.begin = 0.0, 
  this.end = 1.0, 
   this.duration = const Duration(milliseconds: 3000),
   this.intervalStart= 0,
   this.intervalEnd= 1,
     this.curve = Curves.fastOutSlowIn,
      required this.child});


final double begin;

  final double end;

  final Duration duration;

  final double intervalStart;

  final double intervalEnd;

  /// The curve to apply to the animation.
  ///
  /// Defaults to [Curves.linear].
final Curve curve;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(tween:Tween<double>(begin: begin, end: end),
    duration: duration,
    curve: Interval(
      intervalStart, intervalEnd, curve: curve),
      child: child,
      builder: (BuildContext context, double? value, Widget?child){
        return Opacity(opacity: value!,
        child: child,);
      },
    
    );
  }
}


class ScrollAnimate extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double slideOffset;
  final Duration delay;

  const ScrollAnimate({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 700),
    this.slideOffset = 0.2,
    this.delay = Duration.zero,
  });

  @override
  State<ScrollAnimate> createState() => _ScrollAnimateState();
}

class _ScrollAnimateState extends State<ScrollAnimate> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.key.toString() ?? UniqueKey().toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: AnimatedSwitcher(
        duration: widget.duration,
        child: _isVisible
            ? widget.child
                .animate()
                .fadeIn(duration: widget.duration, delay: widget.delay, curve: Curves.easeOut)
                .slideY(begin: widget.slideOffset, duration: widget.duration, curve: Curves.easeOut)
            : SizedBox.shrink(),
      ),
    );
  }
}