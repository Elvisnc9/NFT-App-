


import 'package:flutter/material.dart';

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